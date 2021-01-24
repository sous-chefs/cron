# cron Cookbook

[![Cookbook Version](https://img.shields.io/cookbook/v/cron.svg)](https://supermarket.chef.io/cookbooks/cron)
[![CI State](https://github.com/sous-chefs/cron/workflows/ci/badge.svg)](https://github.com/sous-chefs/cron/actions?query=workflow%3Aci)
[![OpenCollective](https://opencollective.com/sous-chefs/backers/badge.svg)](#backers)
[![OpenCollective](https://opencollective.com/sous-chefs/sponsors/badge.svg)](#sponsors)
[![License](https://img.shields.io/badge/License-Apache%202.0-green.svg)](https://opensource.org/licenses/Apache-2.0)

Installs the cron package and starts the crond service.

Note: Chef 14.4 shipped with the cron_d and cron_access (cron_manage) resources. When Chef 15.4 ships in Aug 2019 these resources will be removed from this cookbook as all users should be on Chef 14.4 or later.

## Maintainers

This cookbook is maintained by the Sous Chefs. The Sous Chefs are a community of Chef cookbook maintainers working together to maintain important cookbooks. If you’d like to know more please visit [sous-chefs.org](https://sous-chefs.org/) or come chat with us on the Chef Community Slack in [#sous-chefs](https://chefcommunity.slack.com/messages/C2V7B88SF).

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
- `minute`, `hour`, `day`, `month`, `weekday` - schedule your cron job. These correspond exactly to their equivalents in the crontab file. All default to "\*".
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

## Contributors

This project exists thanks to all the people who [contribute.](https://opencollective.com/sous-chefs/contributors.svg?width=890&button=false)

### Backers

Thank you to all our backers!

![https://opencollective.com/sous-chefs#backers](https://opencollective.com/sous-chefs/backers.svg?width=600&avatarHeight=40)

### Sponsors

Support this project by becoming a sponsor. Your logo will show up here with a link to your website.

![https://opencollective.com/sous-chefs/sponsor/0/website](https://opencollective.com/sous-chefs/sponsor/0/avatar.svg?avatarHeight=100)
![https://opencollective.com/sous-chefs/sponsor/1/website](https://opencollective.com/sous-chefs/sponsor/1/avatar.svg?avatarHeight=100)
![https://opencollective.com/sous-chefs/sponsor/2/website](https://opencollective.com/sous-chefs/sponsor/2/avatar.svg?avatarHeight=100)
![https://opencollective.com/sous-chefs/sponsor/3/website](https://opencollective.com/sous-chefs/sponsor/3/avatar.svg?avatarHeight=100)
![https://opencollective.com/sous-chefs/sponsor/4/website](https://opencollective.com/sous-chefs/sponsor/4/avatar.svg?avatarHeight=100)
![https://opencollective.com/sous-chefs/sponsor/5/website](https://opencollective.com/sous-chefs/sponsor/5/avatar.svg?avatarHeight=100)
![https://opencollective.com/sous-chefs/sponsor/6/website](https://opencollective.com/sous-chefs/sponsor/6/avatar.svg?avatarHeight=100)
![https://opencollective.com/sous-chefs/sponsor/7/website](https://opencollective.com/sous-chefs/sponsor/7/avatar.svg?avatarHeight=100)
![https://opencollective.com/sous-chefs/sponsor/8/website](https://opencollective.com/sous-chefs/sponsor/8/avatar.svg?avatarHeight=100)
![https://opencollective.com/sous-chefs/sponsor/9/website](https://opencollective.com/sous-chefs/sponsor/9/avatar.svg?avatarHeight=100)
