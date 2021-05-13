# frozen_string_literal: true
name              'postgresql'
maintainer        'Sous Chefs'
maintainer_email  'help@sous-chefs.org'
license           'Apache-2.0'
description       'Installs and configures postgresql for clients or servers'
version           '9.0.0'
source_url        'https://github.com/sous-chefs/postgresql'
issues_url        'https://github.com/sous-chefs/postgresql/issues'
chef_version      '>= 15.3'

depends 'yum-epel'
depends 'apt'

%w(
  amazon
  centos
  debian
  fedora
  oracle
  redhat
  scientefic
  ubuntu
).each do |os|
  supports os
end
