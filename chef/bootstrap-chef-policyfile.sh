#!/bin/bash

export DEBIAN_FRONTEND=noninteractive
apt-get update
apt-get install -y awscli curl jq

sleep 60
mkdir -p /etc/chef
mkdir -p /var/log/chef

export INSTANCE_ID
INSTANCE_ID=$(curl -s http://169.254.169.254/latest/meta-data/instance-id)
export REGION
REGION=$(curl -s http://169.254.169.254/latest/meta-data/placement/availability-zone | sed 's/.$//')
# export CHEF_ENV
# echo $(aws ec2 describe-tags --region "$REGION" --filters "Name=resource-id,Values=$INSTANCE_ID" "Name=key,Values=ChefEnv")
# CHEF_ENV=$(aws ec2 describe-tags --region "$REGION" --filters "Name=resource-id,Values=$INSTANCE_ID" "Name=key,Values=ChefEnv" | jq 'if .Tags[0].Key != "ChefEnv" then "" else .Tags[0].Value end' | sed 's/"//g')
# export CHEF_RUNLIST
# CHEF_RUNLIST=$(aws ec2 describe-tags --region "$REGION" --filters "Name=resource-id,Values=$INSTANCE_ID" "Name=key,Values=ChefRunlist" | jq 'if .Tags[0].Key != "ChefRunlist" then "" else .Tags[0].Value end' | sed 's/,/","/g')

(
cat <<CLIENTRB
  log_location            "/var/log/chef/client.log"

  chef_server_url         "https://api.opscode.com/organizations/mydrive"
  validation_client_name  "mydrive-validator"
  node_name               "$INSTANCE_ID"
CLIENTRB
) > /etc/chef/client.rb

cat /etc/chef/client.rb
# (
# cat <<FIRSTBOOT
# {
#   "run_list" : [ $CHEF_RUNLIST ]
# }
# FIRSTBOOT
# ) > /etc/chef/first-boot.json
# cat /etc/chef/first-boot.json

(
cat <<ATTRIBUTES
{
  "policy_name": "myapp",
  "policy_group": "marco-dev"
}
ATTRIBUTES
) > /etc/chef/attributes.json

cat /etc/chef/attributes.json

curl -LO https://omnitruck.chef.io/install.sh && sudo bash ./install.sh -v 14.4.56

aws s3 cp --region="$REGION" s3://mydrive-infrastructure/validation-keys/mydrive-validator.pem /etc/chef/validation.pem

chmod 600 /etc/chef/validation.pem

mkdir -p /etc/chef/ohai/hints
touch /etc/chef/ohai/hints/ec2.json
touch /etc/chef/ohai/hints/iam.json
# sudo chef-client -j /etc/chef/first-boot.json

# When the hostname binary looks for our fqdn in the DNS records this has no impact.
# When the hostname binary looks for our fqdn in the hosts file this substitution is essential
# as the automatic node attribute for fqdn loaded in by ohai's hosts plugin fails silently on our
# chef run giving us 0 information about the cause.
hostname
sed -i "s/127.0.0.1 localhost/127.0.0.1 $(hostname).$REGION.compute.internal localhost $(hostname)/" /etc/hosts
hostname -f

n=0
until [ $n -ge 5 ]
do
  /opt/chef/bin/chef-client -j /etc/chef/attributes.json && break  # substitute your command here

  n=$((n + 1))

  sleep 10
done
