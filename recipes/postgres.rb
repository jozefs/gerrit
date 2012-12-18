#
# Cookbook Name:: gerrit
# Recipe:: mysql
#
# Copyright 2012, Emanuele Zattin / Switch-Gears
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
 
include_recipe "postgresql::server"

execute :fix_locale do
  command 'export LANGUAGE=en_US.UTF-8'
  command 'export LANG=en_US.UTF-8'
  command 'export LC_ALL=en_US.UTF-8'
  command 'locale-gen en_US.UTF-8'
  command 'sudo dpkg-reconfigure locales'
end

pg_user node['gerrit']['database']['username'] do
  privileges :superuser => false, :createdb => false, :login => true
  password node['gerrit']['database']['password']
end

pg_database node['gerrit']['database']['name'] do
  owner node['gerrit']['database']['username']
  encoding "utf8"
  template "template0"
  locale "en_US.UTF8"
end