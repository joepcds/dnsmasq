package 'dnsmasq'

if(node[:dnsmasq][:enable_dns])
  include_recipe 'hosts_file'
end

service 'dnsmasq' do
  action [:enable, :start]
  supports :restart => true
end

if(node[:dnsmasq][:enable_dns])
  include_recipe 'dnsmasq::dns'
end

if(node[:dnsmasq][:enable_dhcp])
  include_recipe 'dnsmasq::dhcp'
end
