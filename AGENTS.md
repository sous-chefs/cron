# AGENTS.md

## Cookbook Purpose

Provides custom resources for installing, configuring, and managing cron

## Agent Findings

* This cookbook is in an incremental modernization pass. Preserve existing public recipes and attributes unless a later full migration is explicitly selected.
* Dependency management should use `Policyfile.rb`; do not reintroduce Berkshelf.

## Known Limitations

## Package Availability

The cron daemon is installed from each operating system's standard package repositories. This
cookbook does not configure third-party cron package repositories.

### APT (Debian/Ubuntu)

* Debian 12 and 13 provide the `cron` package for the default architectures published by Debian.
* Ubuntu 22.04 and 24.04 provide the `cron` package for the default architectures published by Ubuntu.
* Ubuntu 20.04 is no longer tested because standard support has ended.

### DNF/YUM (RHEL Family, Fedora, Amazon Linux)

* AlmaLinux, CentOS Stream, Oracle Linux, Red Hat Enterprise Linux, Rocky Linux, Fedora, and Amazon
  Linux 2023 provide cron through the `cronie` package.
* Amazon Linux 2 is no longer tested or declared supported because Chef/Cinc 18 requires newer
  glibc/libxcrypt symbols than Amazon Linux 2 provides, and the Chef/Cinc 17 fallback cannot verify
  systemd service management in Dokken.
* CentOS 7, CentOS Stream 8, Debian 9, Debian 10, and Ubuntu 18.04 were removed from testing because
  they are end-of-life.

### Zypper (SUSE)

* openSUSE Leap 15 provides cron through the `cronie` package.

## Architecture Limitations

Package architecture support follows the upstream operating system repositories. The cookbook does
not add architecture-specific package repositories.

## Source/Compiled Installation

This cookbook does not build cron from source.

## Known Issues

* `cron_d` manages files in `/etc/cron.d` and requires Linux cron.d support. Platforms without
  `/etc/cron.d` support should use Chef Infra Client's built-in `cron` resource instead.
* FreeBSD, Solaris, SmartOS, OmniOS, Scientific Linux, and zLinux were removed from cookbook
  metadata because this cookbook's tested public API is Linux cron.d and daemon management.
