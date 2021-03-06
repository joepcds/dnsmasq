begin
  managed_hosts_bag = data_bag_item('dnsmasq', 'managed_hosts')
rescue
  Chef::Log.debug "No data bag found for DNSMasq managed hosts file"
end

managed_hosts = {}
managed_hosts.merge!(managed_hosts_bag['maps']) if managed_hosts_bag
managed_hosts.merge!(node[:dnsmasq][:managed_hosts].to_hash) if node[:dnsmasq][:managed_hosts]

managed_hosts.each do |ip, host|
  hosts_file_entry ip do
    hostname host
    comment 'dnsmasq managed entry'
  end
end
