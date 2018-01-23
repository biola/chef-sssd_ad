sssd_ad Cookbook CHANGELOG
========================
This file is used to list changes made in each version of the sssd_ad cookbook.

v1.1.0 (2018-01-23)
------------------
- Updated version constraint for chef-vault cookbook

v1.0.0 (2017-12-14)
------------------
- Now supports latest Samba cookbook.
- Added checks for configuration and binding to happen in the correct order.
- Breaking Changes:
  - The new Samba cookbook is no longer configured using attributes, so to override default `samba_server` settings in the default recipe, use `edit_resource` or similar in your wrapper cookbook.
  - Changed "workgroup" and "realm" attributes from the `[samba]` namespace to the `[sssd_ad]` namespace.

v0.7.0 (2016-06-22)
------------------
- Added Ubuntu 16.04 support.

v0.6.0 (2016-02-22)
------------------
- Add attribute to set the nss `filter_users` option.
