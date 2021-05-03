# `cron_access`

[Back to resource list](../README.md#resources)

The `cron_access` resource can be used to manage the `/etc/cron.allow` and `/etc/cron.deny` files.

Note: This resource was previously a Chef definition cron_manage. The legacy name will still function, but should be updated.

## Actions

- `:allow` - Add the user to the cron.allow file.
- `:deny` - Add the user to the cron.deny file (default).

## Properties

| Name   | Type   | Default | Description                                                                                    |
| ------ | ------ | ------- | ---------------------------------------------------------------------------------------------- |
| `user` | String |         | Username that you want to control. If not provided the resource name will be used as the user. |

## Examples

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
