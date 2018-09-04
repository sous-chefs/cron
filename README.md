# cron Cookbook

[![Build Status](https://travis-ci.org/chef-cookbooks/cron.svg?branch=master)](https://travis-ci.org/chef-cookbooks/cron) [![Cookbook Version](https://img.shields.io/cookbook/v/cron.svg)](https://supermarket.chef.io/cookbooks/cron)

Installs the cron package and starts the crond service.

Note: Chef 14.4 shipped with the cron_d and cron_access (cron_manage) resources. When Chef 15.4 ships in Aug 2019 these resources will be removed from this cookbook as all users should be on Chef 14.4 or later.

## Requirements

### Platforms

- RHEL family
- Debian family
- Solaris family
- FreeBSD
- SUSE family

### Chef

- Chef 12.7+

### Cookbooks

- none

## Resources

### `cron_d`

The `cron_d` custom resource can be used to manage files in `/etc/cron.d`. It supports the same interface as Chef's built-in `cron` resource:

#### Properties

- `cron_name` - Set the name of the cron job. If this isn't specified we'll use the resource name.
- `minute`, `hour`, `day`, `month`, `weekday` - schedule your cron job. These correspond exactly to their equivalents in the crontab file. All default to "*".
- `predefined_value` - schedule your cron job with one of the special predefined value instead of _**_ * pattern. This correspond to `"@reboot"`, `"@yearly"`, `"@annually"`, `"@monthly"`, `"@weekly"`, `"@daily"`, `"@midnight"` or `"@hourly"`.
- `command` - the command to run. Required.
- `user` - the user to run as. Defaults to "root".
- `mailto`, `path`, `home`, `shell`, `random_delay` - set the corresponding environment variables in the cron.d file. No default.
- `environment` - a Hash containing additional arbitrary environment variables under which the cron job will be run (similar to the `shell` LWRP). No default.
- `comment` - A comment to place in the cron.d file
- `mode` - the octal mode of the generated crontab file. Defaults to `0600`.

#### Examples

```ruby
cron_d 'daily-usage-report' do
  minute  0
  hour    23
  command '/srv/app/scripts/daily_report'
  user    'appuser'
end
```

```ruby
cron_d 'Setup the daily usage cron job' do
  cron_name 'daily-usage-report'
  minute  0
  hour    23
  command '/srv/app/scripts/daily_report'
  user    'appuser'
end
```

### `cron_access`

The `cron_access` resource can be used to manage the `/etc/cron.allow` and `/etc/cron.deny` files.

Note: This resource was previously a Chef definition cron_manage. The legacy name will still function, but should be updated.

#### Actions

- `:deny` - Add the user to the cron.deny file (default).
- `:allow` - Add the user to the cron.allow file.

#### Properties

- `user` - username that you want to control. If not provided the resource name will be used as the user.

#### Examples

The following will add the user mike to the `/etc/cron.allow` file:

```ruby
cron_access 'mike' do
  action :allow
end
```

The following will add the user john to the `/etc/cron.deny` file:

```ruby
cron_access "Make sure john can't touch cron" do
  user 'john'
  action :deny  #optional, deny is the default
end
```

## Maintainers

This cookbook is maintained by Chef's Community Cookbook Engineering team. Our goal is to improve cookbook quality and to aid the community in contributing to cookbooks. To learn more about our team, process, and design goals see our [team documentation](https://github.com/chef-cookbooks/community_cookbook_documentation/blob/master/COOKBOOK_TEAM.MD). To learn more about contributing to cookbooks like this see our [contributing documentation](https://github.com/chef-cookbooks/community_cookbook_documentation/blob/master/CONTRIBUTING.MD), or if you have general questions about this cookbook come chat with us in #cookbok-engineering on the [Chef Community Slack](http://community-slack.chef.io/)

## License

**Copyright:** 2010-2018, Chef Software, Inc.

```
Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```
