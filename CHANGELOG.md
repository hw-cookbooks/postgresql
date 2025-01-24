# postgresql Cookbook CHANGELOG

This file is used to list changes made in the last 3 major versions of the postgresql cookbook.

## Unreleased

- Cast `server_config` keys to strings in `postgresql_config` to avoid unnecessary converges

## 12.0.3 - *2024-12-30*

- Bump version to force supermarket release

## 12.0.2 - *2024-11-18*

Standardise files with files in sous-chefs/repo-management

## 12.0.1 - *2024-11-10*

- resolved cookstyle error: `libraries/sql/_connection.rb:77:11` refactor: `Chef/Style/UnnecessaryPlatformCaseStatement`

## 12.0.0 - *2024-11-05*

- Remove support for Fedora
  Fedora is not an officially supported platform by the Sous Chefs community. If you would like to see Fedora support added back please open a PR to add it back.
  The installation methods for Fedora are substantially different than other platforms and require a lot of additional testing and maintenance.
- Add testing for PostgreSQL 16 and 17
- Add libpq package to default packages
- Fix GPG key URLs
- Update Amazon to Amazon Linux 2023
- Remove unsupported configuration options from the `postgresql_config` resource
  `stats_temp_directory`

## 11.11.2 - *2024-10-07*

Standardise files with files in sous-chefs/repo-management

## 11.11.1 - *2024-09-28*

- Update CI config to remove deprecated platforms

## 11.11.0 - *2024-09-28*

Standardise files with files in sous-chefs/repo-management

Standardise files with files in sous-chefs/repo-management

- Fix installation of `pg` gem build dependency `perl-IPC-Run` on oracle linux 9

## 11.10.3 - *2024-05-03*

- Bump deepsort fuzzy dependency to 0.5.0 to match latest upstream release

## 11.10.2 - *2024-05-03*

## 11.10.1 - *2024-01-31*

- Add `apt_repository_uri` property to `postgresql_install` resource

## 11.10.0 - *2024-01-24*

- Modify installed_postgresql_package_source to get highest PG version from packages
- Remove PG11 suites from kitchen & CI due to upstream removal

## 11.9.0 - *2024-01-05*

## 11.8.5 - *2023-12-18*

- Fix resource property in role library

## 11.8.4 - *2023-12-15*

## 11.8.3 - *2023-10-31*

## 11.8.2 - *2023-09-28*

## 11.8.1 - *2023-09-04*

## 11.8.0 - *2023-09-01*

- Refactor access ordering to allow moves

## 11.7.1 - *2023-08-31*

- Fix package source detection when other packages matching the postgresql name are installed

## 11.7.0 - *2023-08-21*

- Add insert position option for access resources
- Refactor ident class to use update method to empty properties overwriting settings on update

## 11.6.3 - *2023-07-25*

- Fix PostgreSQL version detection

## 11.6.2 - *2023-07-24*

- Prevent `postgresql_config` resource from triggering changes, if `filemode`,
  `owner` or `group` are specified, but there values don't change.

## 11.6.1 - *2023-07-09*

## 11.6.0 - *2023-07-07*

- Allow to configure multiple databases and users in one `pg_hba.conf` entry

## 11.5.1 - *2023-06-26*

- Fix typo in documentation of `postgresql_extension` resource

## 11.5.0 - *2023-06-19*

- Added support for Debian 12

## 11.4.0 - *2023-06-18*

- Allow to configure auth method with complex/multiple option(s)

## 11.3.0 - *2023-06-06*

- Allow package installation from OS distribution repository

## 11.2.12 - *2023-05-16*

## 11.2.11 - *2023-05-04*

- Make the encrypted_password property in the role resource idempotent.

## 11.2.10 - *2023-05-04*

- Fix unparsable pg\_hba.conf when a column value is longer than the max width

## 11.2.9 - *2023-05-04*

- Update CI permissions and remove markdown-link check

## 11.2.8 - *2023-04-17*

## 11.2.7 - *2023-04-07*

Standardise files with files in sous-chefs/repo-management

## 11.2.6 - *2023-04-01*

## 11.2.5 - *2023-04-01*

## 11.2.4 - *2023-04-01*

Standardise files with files in sous-chefs/repo-management

## 11.2.3 - *2023-03-15*

Standardise files with files in sous-chefs/repo-management

Standardise files with files in sous-chefs/repo-management

Standardise files with files in sous-chefs/repo-management

## 11.2.2 - *2023-02-27*

## 11.2.1 - *2023-02-21*

- Make database names an identifier to allow additional permitted characters
- Make sure perl-IPC-Run package is installed for RHEL 8/9 platforms

## 11.2.0 - *2023-02-20*

- Allow database encoding to be specified as a String

## 11.1.6 - *2023-02-19*

Standardise files with files in sous-chefs/repo-management

Standardise files with files in sous-chefs/repo-management

## 11.1.5 - *2023-02-15*

## 11.1.4 - *2023-02-14*

Standardise files with files in sous-chefs/repo-management

## 11.1.3 - *2023-02-01*

- Fix regex not matching databases names containing dashes and underscores
- Update formatting output of pg_hba to support longer values

## 11.1.2 - *2023-01-12*

- Fix regex not matching usernames containing characters other than word characters

## 11.1.1 - *2022-12-22*

## 11.1.0 - *2022-12-20*

- resolved cookstyle error: resources/role.rb:1:1 refactor: `Chef/Deprecations/ResourceWithoutUnifiedTrue`
- Fix connection to server via local socket
- Fix parsing of address field in `pga_hba.conf`

## 11.0.1 - *2022-12-13*

Standardise files with files in sous-chefs/repo-management

## 11.0.0 - *2022-12-13*

- Major refactor, see [UPGRADING.md](UPGRADING.md)
- Condense repository, client_install and server_install into common install resource with actions replacing the previous split resources.
  - `:repository` action
  - `:install` action
  - `:client_install` action
  - `:server_install` action
- Refactor database, role (user) and extension resources to use pg gem for database access
  - All `load_current_value` support
- Rename user resource to role to match PostgreSQL (still aliased to `:postgresql_user`)
- Update various resource properties to match PostgreSQL side

## 10.0.2 - *2022-12-04*

Standardise files with files in sous-chefs/repo-management

Standardise files with files in sous-chefs/repo-management

## 10.0.1 - *2022-02-04*

- Remove delivery and move to calling RSpec directly via a reusable workflow
- Update tested platforms

## 10.0.0 - *2021-10-19*

- Move connection options to a resource partial
- Require Chef 16+ for resource partials

## 9.1.0 - *2021-10-07*

- Use `dnf_module` resource from yum cookbook instead of manually shelling out
  - requires new dependency on `yum` >= 7.2.0
- Remove unneeded `apt` & `yum-epel` dependencies
- Move resource documentation out of README

## 9.0.3 - *2021-08-30*

- Standardise files with files in sous-chefs/repo-management
- resolved cookstyle error: spec/libraries/helpers_spec.rb:84:31 convention: `Layout/ClosingParenthesisIndentation`

## 9.0.2 - *2021-06-01*

- Standardise files with files in sous-chefs/repo-management

## 9.0.1 - *2021-05-13*

- Prevent leaking the users password during account creation

## 9.0.0 - *2021-05-13*

- Use unified_mode for Chef 17 support
- Update minimum Chef version top 15.3 where unified mode was introduced
- Drop testing PostgreSQL 9.5 support now it's EOL
- Add PostgreSQL 13 testing

## 8.3.0 - *2021-03-24*

- Fix idempotency when installing multiple client versions

## 8.2.1 - *2021-02-08*

- Fix changelog formatting

## 8.2.0 - *2021-02-04*

- Makes psqlrc optional when invoking `psql_command_string`

## 8.1.1 - *2021-01-12*

- Fix attribute updates for users with dashes

## 8.1.0 - *2020-12-09*

- Fix potential password exposure in logs

## 8.0.2 - *2020-11-20*

- Fix quoting of DROP ROLE query

## v8.0.1 (2020-11-12)

- Use system default locale when creating databases
- resolved cookstyle error: spec/libraries/helpers_spec.rb:2:18 convention: `Style/RedundantFileExtensionInRequire`

## v8.0.0 (2020-08-26)

- Bumped default version of postgresql to 12
- Added support for dnf by disabling the postgresql module on repo configuration
- Add support for the pgdg-common repository
- Add provides to resources
- Add tests for currently supported postgresql releases
- remove need to surround extension names with "" if they contain a '-'
- resolved cookstyle error: libraries/helpers.rb:43:7 convention: `Style/RedundantAssignment`
- resolved cookstyle error: libraries/helpers.rb:46:1 convention: `Layout/EmptyLinesAroundMethodBody`
- resolved cookstyle error: libraries/helpers.rb:46:1 convention: `Layout/TrailingWhitespace`

## v7.1.9 (2020-05-14)

- resolved cookstyle error: resources/access.rb:30:28 convention: `Layout/TrailingWhitespace`
- resolved cookstyle error: resources/access.rb:30:29 refactor: `ChefModernize/FoodcriticComments`
- resolved cookstyle error: resources/access.rb:54:44 convention: `Layout/TrailingWhitespace`
- resolved cookstyle error: resources/access.rb:54:45 refactor: `ChefModernize/FoodcriticComments`
- resolved cookstyle error: resources/ident.rb:50:44 convention: `Layout/TrailingWhitespace`
- resolved cookstyle error: resources/ident.rb:50:45 refactor: `ChefModernize/FoodcriticComments`
- resolved cookstyle error: resources/repository.rb:35:59 convention: `Layout/TrailingWhitespace`
- resolved cookstyle error: resources/repository.rb:35:60 refactor: `ChefModernize/FoodcriticComments`
- resolved cookstyle error: resources/user.rb:39:66 convention: `Layout/TrailingWhitespace`
- resolved cookstyle error: resources/user.rb:39:67 refactor: `ChefModernize/FoodcriticComments`

## v7.1.8 (2020-02-22)

- Fix incorrect ubuntu platform family value in `postgresql_server_install`
- Re-add unit tests that were skipped

## v7.1.7 (2020-02-21)

- Correctly configure postgres-common on Ubuntu hosts (fixes #596)

## v7.1.6 (2020-02-20)

- Remove unnecessary nil default in resource properties
- Migrate to GitHub Actions for testing

## v7.1.5 (2019-11-18)

- Allow to install extensions with hyphens, ex: `postgresql_extension '"uuid-ossp"'`
- Update Circle CI config to match sous-chefs defaults #617
- Remove Fedora testing from CI, not an official supported OS by sous-chefs, PRs welcome #617

## v7.1.4 (2019-03-28)

- Fix installation of extensions.

## v7.1.3 (2019-01-15)

- Added support for dash in database role name.

## v7.1.2 (2019-06-01)

- Cleanup and update the user resource documentation and code. Removed extraneous 'sensitive' property which is a common property in all Chef resources.
- Change default permissions on the postgres.conf to be world readable so that psql can work.

## v7.1.1 (2018-09-26)

- Rename slave to follower
- Use CircleCI for testing
- Simplyfy extension resource

## v7.1.0 (2018-06-22)

- Update the `initdb` script to use initdb rather than a service. #542
- Refactor database commands to use the common connect method. #535
- Increase the unit test coverage.

## v7.0.0 (2018-05-25)

*Breaking Change* Please see UPGRADING.md and the README.md for information how to use.

- Add custom resources for:

  - `postgresql_client_install`
  - `postgresql_server_install`
  - `postgresql_repository`
  - `postgresql_pg_gem`

- Deprecate recipes:

  - `apt_pgdg_postgresql`
  - `config_initdb`
  - `config_pgtune`
  - `contrib`
  - `ruby`
  - `yum_pgdg_postgresql`

- Remove deprecated tests

## v6.1.3 (2018-04-18)

- Fix recipes referencing the old helpers

## v6.1.2 (2018-04-16)

this will be the last release of the 6.0 series before all recipes are removed from the cookbook

- Deprecate all recipes

## v6.1.1 (2017-03-08)

- Fix pg gem installation on non-omnibus chef runs
- Resolve resource cloning deprecation warnings in the ruby recipe
- Fix issues resolving the timezone on CentOS 7 and probably other distros
- Test with Delivery local instead of Rake

## v6.1.0 (2017-02-18)

- Fix a method name conflict that caused errors if Chef Sugar was also being used on the run list
- Revert a previous PR that added support for Postgresql 9.6 as it introduced incorrect configuration values
- Added Fedora 25 support for pgdg packages
- Added RHEL 5 support for Postgresql 9.4 pgdg packages
- Removed testing for RHEL 5 and Ubuntu 12.04 as they are scheduled for EoL in the near future
- Improvements to Test Kitchen testing to allow more extensive testing in Travis CI
- Fixed the client recipe on Fedora
- Added Inspec tests for client installs

## v6.0.1 (2017-01-04

- Fix systemd unit file template

## v6.0.0 (2017-01-03)

- This cookbook now requires Chef 12.1 or later
- Removed the dependency on the apt cookbook as this functionality is built into modern chef client releases
- Added a new custom resource for installing extensions. This acts as a replacement for the contrib recipe with minimal backwards compatibility. You can now install / remove extensions into any database. This adds the compat_resource cookbook dependency so we can continue to support Chef 12.1-12.4, which lack custom resource support.
- The unused get_result_orig helper has been removed. If you utilized this you'll want to move it to your own wrapper cookbook
- Updates for compatibility with Postgresql 9.5 and 9.6
- Fixed client package installation on openSUSE Leap 42.2
- ca-certificates recipe has been deprecated. If ca-certificates package needs to be upgraded the user should do so prior to including this recipe. Package upgrades in community cookbooks are generally a bad idea as this bring in updated packages to production systems. The recipe currently warns if used and will be removed with the next major cookbook release.
- Fixed RHEL platform detection in the Ruby recipe
- systemd fixes for RHEL systems
- Fix systemd service file include when using pgdg packages
- Package installation now uses multi-package installs to speed up converge times
- Added integration testing in Travis of the client recipe using a new test cookbook. This will be expanded in the future to cover server installation as well
- Expanded the specs to test converges on multiple platforms

## v5.2.0 (2016-12-30)

- Updated contacts and links to point to Sous Chefs now
- Added a Code of Conduct (the Chef CoC)
- Removed duplicate platforms in the metadata
- Fix Chef runs with local mode in the server recipe
- Fix the ruby recipe to not fail when you specify enabling both the apt and yum repos for mixed distro environments
- Set the postgresql data directory to 700 permissions
- Added node['postgresql']['pg_gem']['version'] to specify the version of the pg gem to install
- Cookstyle fixes for the latest cookstyle release
- Removed test deps from the Gemfile. Rely on ChefDK for base testing deps instead

## v5.1.0 (2016-11-01)

- Maintenance of this cookbook has been migrated from Heavy Water to Sous Chefs - <https://sous-chefs.org/>
- Add support for Chef-Zero (local mode)
- Don't hardcode the UID / GID on RHEL/Amazon/Suse platforms
- Add PGDG yum RPMs for 9.5 / 9.6

## v5.0.0 (2016-10-25)

### Breaking changes

- Switched from Librarian to Berkshelf
- Remove support for the following platforms

  - SLES < 12
  - openSUSE < 13
  - Debian < 7
  - Ubuntu < 12.04
  - RHEL < 6
  - Amazon < 2013
  - Unsupported (EOL) Fedora releases

### Other changes

- Added support for Ubuntu 16.04
- Loosened cookbook dependencies to not prevent pulling in the latest community cookbooks
- Added chef_version metadata
- Switched from rubocop to cookstyle and fix all warnings
- Removed minitests and the minitest handler
- Added support for opensuse / opensuseleap
- Added support for Fedora 23/24
- Added a chefignore file to limit the files uploaded to the chef server
- Updated Test Kitchen config to test on modern platform releases
- Added a Rakefile and updated Travis to test with ChefDK and that rakefile
- Avoid installing packages included in build-essential twice in the ruby recipe
- Require at least build-essential 2.0
- Don't cleanup the old PPA files in the apt_pgdg_postgresql recipe anymore. These should be long gone everywhere
- Remove logic in the apt_pgdg_postgresql recipe that made Chef fail when new distro releases came out
- Avoid node.set deprecation warnings
- Avoid managed_home deprecation warnings in server_redhat recipe
