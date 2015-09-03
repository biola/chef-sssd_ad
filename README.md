# sssd_ad

This cookbook installs SSSD on a Ubuntu system and configures it for Active Directory authentication. It loosely follows the directions found here: https://help.ubuntu.com/lts/serverguide/sssd-ad.html.

IMPORTANT: This cookbook assumes the system's FQDN (e.g. 'server.example.contoso.com') is in /etc/hosts. Joining the domain may fail if this is not the case. See the above link for details.

Platforms
---------
Tested on Ubuntu 14.04.

Attributes
-----------
- `['sssd_ad']['access_filter']` - optional `ad_access_filter` for the joined domain, e.g. "`(&(sAMAccountName=jo*)(unixHomeDirectory=*))`"
- `['sssd_ad']['cache_credentials']` - boolean to enable SSSD credential caching; defaults to false
- `['sssd_ad']['dc']` - the FQDN of the primary domain controller
- `['sssd_ad']['use_ntp']` - configure NTP to sync with the primary domain controller; defaults to true
- `['sssd_ad']['join_domain']` - join the system to the domain (requires credentials in a chef-vault item); defaults to false
- `['sssd_ad']['vault_name']` - name of the data bag containing domain credentials
- `['sssd_ad']['vault_item']` - name of the chef-vault item containing domain credentials

Usage
-----
Add the `sssd_ad::default` recipe to the node's run list, and set the `['samba']['workgroup']`, `['samba']['options']['realm']`, and `['sssd_ad']['dc']` attributes. If the system should be joined to the domain automatically, set the `join_domain` attribute to true and create a chef-vault item containing AD credentials that have appropriate permissions.
