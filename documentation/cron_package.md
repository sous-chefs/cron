# cron_package

[Back to resource list](../README.md#resources)

Install cron service from package.

Introduced: v7.0.0

## Actions

- `:install`
- `:upgrade`
- `:remove`

## Properties

| Name       | Type          | Default                       | Description                                 |
| ---------- | ------------- | ----------------------------- | ------------------------------------------- |
| `packages` | String, Array | Correct packages for platform | List of packages to install for cron daemon |

## Examples

```ruby
cron_package 'cron'
```

```ruby
cron_package 'cron' do
  packages 'cron-special-package'
end
```
