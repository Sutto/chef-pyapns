action :add do
  app_path = ::File.join(node[:pyapns][:apps_path], "#{new_resource.app_id}.json")
  file app_path do
    action :create
    mode   "0644"
    owner  node[:pyapns][:user]
    group  node[:pyapns][:group]
    content(JSON.dump({
      :app_id      => new_resource.app_id,
      :environment => new_resource.environment,
      :cert        => new_resource.cert,
      :timeout     => new_resource.timeout
    }))
  end
end

action :remove do
  app_path = ::File.join(node[:pyapns][:apps_path], "#{new_resource.app_id}.json")
  file app_path do
    action :delete
  end
end
