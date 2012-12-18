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

# Default the locale to en_US.utf8. If not creating the table will fail
include_recipe "locale"
 
include_recipe "postgresql::server"
include_recipe "database::postgresql"

postgresql_connection_info = {
  :host =>  node['gerrit']['database']['host'],
  :port => "5432",
  :username => "postgres",
  :password => node['postgresql']['password']['postgres']
}

postgresql_database_user node['gerrit']['database']['username'] do
  Chef::Log.info("Creating Postgresql user: #{node['gerrit']['database']['username']}")
  connection postgresql_connection_info
  password node['gerrit']['database']['password']
  action :create
end

postgresql_database node['gerrit']['database']['name'] do
  Chef::Log.info("Creating Postgresql database: #{node['gerrit']['database']['name']}")
  connection postgresql_connection_info
  owner     node['gerrit']['database']['username']
  encoding  "UTF-8"
  action :create
end



