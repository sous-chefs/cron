# cron Cookbook

[![Cookbook Version](https://img.shields.io/cookbook/v/cron.svg)](https://supermarket.chef.io/cookbooks/cron)
[![CI State](https://github.com/sous-chefs/cron/workflows/ci/badge.svg)](https://github.com/sous-chefs/cron/actions?query=workflow%3Aci)
[![OpenCollective](https://opencollective.com/sous-chefs/backers/badge.svg)](#backers)
[![OpenCollective](https://opencollective.com/sous-chefs/sponsors/badge.svg)](#sponsors)
[![License](https://img.shields.io/badge/License-Apache%202.0-green.svg)](https://opensource.org/licenses/Apache-2.0)

This cookbook provides custom resources for installing the cron daemon, managing the daemon service,
rendering files in `/etc/cron.d`, and managing cron allow/deny lists.

> [!IMPORTANT]
> This release finishes the custom-resource migration and removes support for Chef Infra Client
> releases older than 15.3. See [migration.md](migration.md) before upgrading wrapper cookbooks.

## Maintainers

This cookbook is maintained by the Sous Chefs. The Sous Chefs are a community of Chef cookbook maintainers working together to maintain important cookbooks. If you’d like to know more please visit [sous-chefs.org](https://sous-chefs.org/) or come chat with us on the Chef Community Slack in [#sous-chefs](https://chefcommunity.slack.com/messages/C2V7B88SF).

## Requirements

### Platforms

- AlmaLinux 8+
- Amazon Linux 2023
- CentOS Stream 9+
- Debian 12+
- Fedora
- openSUSE Leap 15
- Oracle Linux 8+
- Red Hat Enterprise Linux 8+
- Rocky Linux 8+
- Ubuntu 22.04+

See [AGENTS.md](AGENTS.md) for package and platform notes.

### Chef

- Chef 15.3+

## Resources

- [cron_access](documentation/cron_access.md)
- [cron_d](documentation/cron_d.md)
- [cron_package](documentation/cron_package.md)
- [cron_service](documentation/cron_service.md)

## Migration

See [migration.md](migration.md) for the breaking changes and resource examples.

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
