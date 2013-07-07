include_recipe 'python'

config       = node['pyapns']
service_name = config['service_name']

group_name = config['group']
user_name  = config['user']
home_dir   = config['home']
apps_dir   = config['apps_path']


service service_name do
  provider Chef::Provider::Service::Upstart
  supports :status => true, :restart => true, :reload => true
  action   [:stop, :disable]
end

file "/etc/init/#{service_name}.conf" do
  action :delete
end

python_pip "pyapns" do
  action :remove
end

user user_name do
  gid     group_name
  home    home_dir
  comment "PyAPNS user"
  shell   "/bin/bash"
  system  true
  action :remove
end

group group_name do
  system true
  action :remove
end

directory home_dir do
  owner     user_name
  group     group_name
  recursive true
  action :delete
end

directory apps_dir do
  owner     user_name
  group     group_name
  recursive true
  action :delete
end
