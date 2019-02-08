# Policyfile.rb - Describe how you want Chef to build your system.
#
# For more information on the Policyfile feature, visit
# https://docs.chef.io/policyfile.html

# A name that describes what the system you're building with Chef does.
name 'myapp'

# Where to find external cookbooks:

#default_source :supermarket

default_source :supermarket, "https://supermarket.chef.io" do |s|
  s.preferred_for "zypper", "yum-epel", "yum", "xfs", "windows", "ssh", "seven_zip", "runit", "rsyslog", "python", "powershell", "partial_search", "packagecloud", "ohai", "nginx", "ms_dotnet4", "mingw", "logrotate", "cron", "compat_resource", "chef_handler", "chef-client", "build-essential", "bluepill", "aws", "ark", "apt", "7-zip"
end

default_source :chef_server, "https://manage.chef.io/organizations/mydrive" #do |s|
  #s.preferred_for "chef-client", "mydrive-nginx", "zypper", "yum-epel", "yum", "xfs", "windows", "ssh", "seven_zip", "runit", "rsyslog", "python", "powershell", "partial_search", "packagecloud", "ohai", "nginx", "ms_dotnet4", "mingw", "logrotate", "cron", "compat_resource", "chef_handler", "build-essential", "bluepill", "aws", "ark", "apt", "7-zip"
#end


# run_list: chef-client will run these recipes in the order specified.
run_list 'myapp::default', 'marco-base', 'nginx'

# Specify a custom source for a single cookbook:
cookbook 'myapp', path: '.'
cookbook 'marco-base', "0.1.2", path: '../marco-base'
cookbook 'chef-client'
#cookbook "jenkins", "~> 6.2.1"
cookbook 'nginx', '8.0.0'
#cookbook 'mydrive-nginx', '1.0.0'



default['marco-dev'] = {
  myapp: {
    database: 'db-dev-02'
  }
}

default['marco-prod'] = {
  myapp: {
    database: 'db-prod-01'
  }
}
