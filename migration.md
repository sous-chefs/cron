# Migration Guide

## Full Custom Resource Migration

This release finishes the migration of the cron cookbook to a modern custom-resource-only public
API. The cookbook root contains no public `recipes/` or `attributes/` directories. Wrapper cookbooks,
roles, and Policyfiles should declare resources directly.

## Chef Infra Client

Chef Infra Client 15.3 or later is required. This is the minimum version that supports
`unified_mode true` for custom resources.

## Platform Support

The supported platform list now reflects actively tested Linux platforms with cron.d support. See
[AGENTS.md](AGENTS.md) for package availability and removed EOL platforms.
Amazon Linux 2 is removed from the declared support list because the current Chef/Cinc client cannot
run on its libc baseline, and the older client fallback cannot verify the service resource under
Dokken.

## Resource Usage

Install and start cron:

```ruby
cron_package 'default'

cron_service 'default' do
  action %i(enable start)
end
```

Render a file in `/etc/cron.d`:

```ruby
cron_d 'daily-report' do
  minute '0'
  hour '23'
  command '/srv/app/scripts/daily_report'
  user 'appuser'
end
```

Manage cron access:

```ruby
cron_access 'appuser' do
  action :allow
end
```

The legacy `cron_manage` alias for `cron_access` still resolves for compatibility, but new code
should use `cron_access`.
