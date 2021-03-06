#
# Cookbook Name:: gerrit
# Attributes:: default
#
# Copyright 2011, Myplanet Digital
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
#

default['gerrit']['flavor'] = "war"

default['gerrit']['version'] = "2.5.2"
default['gerrit']['download_url'] = "http://gerrit.googlecode.com/files/gerrit-full-#{node['gerrit']['version']}.war"

default['gerrit']['source']['repository'] = "https://gerrit.googlesource.com/gerrit"

default['gerrit']['user'] = "gerrit"
default['gerrit']['group'] = "gerrit"
default['gerrit']['home'] = "/var/gerrit"
default['gerrit']['install_dir'] = "#{node['gerrit']['home']}/review"

default['gerrit']['hostname'] = node['fqdn']
default['gerrit']['canonicalWebUrl'] = "http://#{node['gerrit']['hostname']}/"
default['gerrit']['port'] = "29418"
default['gerrit']['proxy'] = true
default['gerrit']['canonicalGitUrl'] = nil

# if this is set, an entry in the ssl_certificates data bag matching the given name must exist
# this uses the ssl-certificates cookbook
# http://github.com/binarymarbles/chef-ssl-certificates
default['gerrit']['ssl'] = false
default['gerrit']['ssl_certificate'] = nil


default['gerrit']['database']['type'] = "MYSQL"
default['gerrit']['database']['host'] = "localhost"
default['gerrit']['database']['name'] = "gerrit"
default['gerrit']['database']['username'] = "gerrit"
default['gerrit']['database']['password'] = "gerrit"
default['gerrit']['database']['encoding'] = "LATIN1"
default['gerrit']['database']['locale'] = "en_US"

default['gerrit']['theme']['compile_files'] = []
default['gerrit']['theme']['static_files'] = []

default['gerrit']['peer_keys']['enabled'] = false
default['gerrit']['peer_keys']['public'] = ""
default['gerrit']['peer_keys']['private'] = ""

# authentication method
default['gerrit']['auth']['type'] = "OPENID"

# LDAP configuration (use "LDAP" for authentication method)
default['gerrit']['ldap']['server'] = "ldap://ldap.example.com"
default['gerrit']['ldap']['accountBase'] = "ou=people,dc=example,dc=com"
default['gerrit']['ldap']['accountPattern'] = ""
default['gerrit']['ldap']['accountFullName'] = ""
default['gerrit']['ldap']['accountEmailAddress'] = ""
default['gerrit']['ldap']['groupBase'] = "ou=groups,dc=example,dc=com"
default['gerrit']['ldap']['groupMemberPattern'] = ""
default['gerrit']['ldap']['localUsernameToLowerCase'] = false
