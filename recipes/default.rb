#
# Cookbook Name:: sssd_ad
# Recipe:: default
#
# Copyright 2015 Biola University
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Install packages
package 'krb5-user'
package 'sssd'

# Install and configure Samba
samba_server 'default' do
  security 'ADS'
  kerberos_method 'secrets and keytab'
  workgroup node['sssd_ad']['workgroup']
  realm node['sssd_ad']['realm']
  enable_users_search false
  options(
    'client signing' => 'yes',
    'client use spnego' => 'yes'
  )
end

# Configure Kerberos
template '/etc/krb5.conf' do
  source 'krb5.conf.erb'
  owner 'root'
  group 'root'
  mode '0644'
end

# Configure NTP
include_recipe 'sssd_ad::ntp' if node['sssd_ad']['use_ntp']

# Join the domain if specified
include_recipe 'sssd_ad::join_domain' if node['sssd_ad']['join_domain']

# Install sssd config
template '/etc/sssd/sssd.conf' do
  source 'sssd.conf.erb'
  owner 'root'
  group 'root'
  mode '0600'
  notifies :restart, 'service[sssd]' if ::File.exist?('/etc/krb5.keytab')
end

service 'sssd' do
  supports restart: true
  if node['sssd_ad']['join_domain']
    action :enable
    subscribes :start, "execute[join #{node['sssd_ad']['realm']} domain]"
  else
    action [:start, :enable]
  end
end
