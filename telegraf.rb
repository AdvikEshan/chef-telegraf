version=node['telegraf']['version']
arch=node['telegraf']['arch']

case node['platform']

when 'amazon', 'redhat', 'centos', 'fedora'  
    remote_file "/opt/telegraf_#{version}_#{arch}.rpm" do
        source node['telegraf']['download_url']
        owner 'root'
        group 'root'
    end
    rpm_package 'telegraf' do
        source "/opt/telegraf_#{version}_#{arch}.rpm"
        action :install
    end
else
    remote_file "/opt/telegraf_#{version}_#{arch}.deb" do
        source node['telegraf']['download_url']
        owner 'root'
        group 'root'
    end

    dpkg_package 'telegraf' do
        source "/opt/telegraf_#{version}_#{arch}.deb"
        action :install
    end
end

service 'telegraf' do
    action :enable
end

template '/etc/telegraf/telegraf.conf' do
    source 'telegraf.conf.erb'
    owner 'root'
    group 'root'
    mode 0644
    notifies :restart, 'service[telegraf]', :delayed
end
    