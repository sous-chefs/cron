cron Cookbook
=============
Installs the cron package and starts the crond service.


Requirements
------------
Platforms:
- RHEL family
- Debian family
- Solaris family
- Gentoo


Resources and Providers
-----------------------
### `cron_d`
The `cron_d` LWRP can be used to manage files in `/etc/cron.d`. It supports the same interface as Chef's built-in `cron` resource:

```ruby
cron_d 'daily-usage-report' do
  minute  0
  hour    23
  command '/srv/app/scripts/daily_report'
  user    'appuser'
end
```

Note: This LWRP does not function on Solaris platforms because they do not support running jobs stored in /etc/cron.d.

#### Attributes
* `minute`, `hour`, `day`, `month`, `weekday` - schedule your cron job. These correspond exactly to their equivalents in the crontab file. All default to "*".
* `predefined_value` - schedule your cron job with one of the special predefined value instead of * * * * * pattern. This correspond to @reboot, @yearly, @annually, @monthly, @weekly, @daily, @midnight or @hourly.
* `command` - the command to run. Required.
* `user` - the user to run as. Defaults to "root".
* `mailto`, `path`, `home`, `shell` - set the corresponding environment variables in the cron.d file. No default.
* `environment` - a Hash containing additional arbitrary environment variables under which the cron job will be run (similar to the `shell` LWRP).  No default.
* `mode` - the octal mode of the generated crontab file.  Defaults to `0644`.

Definitions
-----------
### `cron_manage`
The `cron_manage` definition can be used to manage the `/etc/cron.allow` and `/etc/cron.deny` files.
Incude this cookbook as dependency to your cookbook and execute the definition as:

The following will add the user mike to the `/etc/cron.allow` file:

```ruby
cron_manage 'mike' do
  user   'mike'
  action :allow
end
```

The following will add the user john to the `/etc/cron.deny` file:

```ruby
cron_manage 'john' do
  user  'john'  #optional, resource name will be used if not specified.
  action :deny  #optional, deny is the default
end
```

#### Attributes
* `user` - username that you want to control (optional).
* `action` - `:allow` or `:deny`. :deny is the default.

License & Authors
-----------------
- Author:: Joshua Timberman (joshua@opscode.com)

```text
Copyright 2010-2012, Opscode, Inc.

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
