# Policyfile.rb - Describe how you want Chef to build your system.
#
# For more information on the Policyfile feature, visit
# https://docs.chef.io/policyfile.html

# A name that describes what the system you're building with Chef does.
name 'marco-base'

# Where to find external cookbooks:
default_source :supermarket
# default_source :chef_server, "https://manage.chef.io/organizations/mydrive" do |s|
#   s.preferred_for "chef-client", "nginx"
# end

# run_list: chef-client will run these recipes in the order specified.
run_list 'marco-base::default',
         'chef-client',
         'os-hardening',
         'nginx',
         'mydrive-cloudwatch-logs'

# Specify a custom source for a single cookbook:
cookbook 'marco-base', path: '.'
cookbook 'chef-client'
cookbook 'os-hardening'
#cookbook 'mydrive-nginx', '0.2.5'
cookbook 'nginx', '7.0.0'
cookbook 'mydrive-cloudwatch-logs', path: '/Users/marco/Documents/github/mydrive-infrastructure/chef/wrapper/mydrive-cloudwatch-logs'
