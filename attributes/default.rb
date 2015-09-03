#
# Cookbook Name:: sssd_ad
# Attributes:: default
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

default['sssd_ad']['access_filter'] = nil
default['sssd_ad']['dc'] = 'dc.example.contoso.com'
default['sssd_ad']['use_ntp'] = true
default['sssd_ad']['join_domain'] = false

default['sssd_ad']['vault_name'] = 'vault'
default['sssd_ad']['vault_item'] = 'sssd_ad'

default['samba']['enable_users_search'] = false
default['samba']['workgroup'] = 'CONTOSO'
default['samba']['security'] = 'ads'
default['samba']['options'] = {
  'client signing' => 'yes',
  'client use spnego' => 'yes',
  'kerberos method' => 'secrets and keytab',
  'realm' => 'EXAMPLE.CONTOSO.COM'
}
