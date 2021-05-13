# cron_service

[Back to resource list](../README.md#resources)

Manage the system cron daemon service.

Introduced: v7.0.0

## Actions

- `:install`
- `:remove`

## Properties

| Name           | Type   | Default                      | Description                                     |
| -------------- | ------ | ---------------------------- | ----------------------------------------------- |
| `service_name` | String | Correct service for platform | Service to manage for cron daemon functionality |

## Examples

```ruby
cron_service 'cron'
```

```ruby
cron_service 'cron' do
  service_name 'cron-special-service'
  action %i(stop disable)
end
```
