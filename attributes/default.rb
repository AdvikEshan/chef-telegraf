if node['platform'] == 'amazon'
	default['telegraf']['download_url'] = "https://dl.influxdata.com/telegraf/releases/telegraf-1.7.0-1.x86_64.rpm"
else
	default['telegraf']['download_url'] = "https://dl.influxdata.com/telegraf/releases/telegraf_1.6.3-1_amd64.deb"
end

if node['platform'] == 'amazon'
	default['telegraf']['version'] = '1.7.0-1'
else
	default['telegraf']['version'] = '1.6.3-1'
end

default['telegraf']['arch'] = 'amd64'

