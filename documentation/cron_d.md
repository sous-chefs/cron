# `cron_d`

[Back to resource list](../README.md#resources)

The `cron_d` custom resource can be used to manage files in `/etc/cron.d`. It supports the same interface as Chef's built-in `cron` resource:

## Actions

- `:create`
- `:create_if_missing`
- `:delete`

## Properties

| Name               | Type            | Default  | Description                                                                                                                      |
| ------------------ | --------------- | -------- | -------------------------------------------------------------------------------------------------------------------------------- |
| `cron_name`        | String          | `nil`    | Set the name of the cron job. If this isn't specified we'll use the resource name                                                |
| `predefined_value` | String          | `nil`    | Schedule your cron job with one of the special predefined value instead of _**_ * pattern.                                       |
|                    |                 |          | This corresponds to `"@reboot"`, `"@yearly"`, `"@annually"`,`"@monthly"`, `"@weekly"`, `"@daily"`, `"@midnight"` or `"@hourly"`. |
| `minute`           | Integer, String | `'*'`    | Schedule your cron job. These correspond exactly to their equivalents in the crontab file. All default to "\*".                  |
| `hour`             | Integer, String | `'*'`    | Schedule your cron job. These correspond exactly to their equivalents in the crontab file. All default to "\*".                  |
| `day`              | Integer, String | `'*'`    | Schedule your cron job. These correspond exactly to their equivalents in the crontab file. All default to "\*".                  |
| `month`            | Integer, String | `'*'`    | Schedule your cron job. These correspond exactly to their equivalents in the crontab file. All default to "\*".                  |
| `weekday`          | Integer, String | `'*'`    | Schedule your cron job. These correspond exactly to their equivalents in the crontab file. All default to "\*".                  |
| `command`          | String          | `'*'`    | The command to run. Required for `:create` and `:create_if_missing` actions.                                                     |
| `user`             | String          | `'root'` | The user to run as.                                                                                                              |
| `mailto`           | String          | `'*'`    | Set the corresponding environment variables in the cron.d file.                                                                  |
| `path`             | String          | `'*'`    | Set the corresponding environment variables in the cron.d file.                                                                  |
| `home`             | String          | `'*'`    | Set the corresponding environment variables in the cron.d file.                                                                  |
| `shell`            | String          | `'*'`    | Set the corresponding environment variables in the cron.d file.                                                                  |
| `random_delay`     | Integer         | `'*'`    | Set the corresponding environment variables in the cron.d file.                                                                  |
| `environment`      | Hash            | `{}`     | Hash containing additional arbitrary environment variables under which the cron job will be run (similar to the `shell` LWRP)    |
| `comment`          | String          | `'*'`    | A comment to place in the cron.d file.                                                                                           |
| `mode`             | String, Integer | `'0600'` | The octal mode of the generated crontab file.                                                                                    |

## Examples

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
