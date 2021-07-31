#!/bin/bash
brew services stop postgresql 
sudo rm -rf /usr/local/var/postgres/postmaster.pid
sudo rm -rf /Users/lukehowsam/Library/LaunchAgents/homebrew.mxcl.postgresql.plist
sudo rm -rf /Users/lukehowsam/Library/Caches/Homebrew/downloads/
sudo rm /etc/sysctl.conf
sudo rm -rf /usr/local/share/doc/postgresql
sudo rm -rf /usr/local/share/doc/postgresql
brew uninstall postgresql 
brew remove postgresql
brew uninstall postgresql13.1
brew remove postgresql13.1
brew doctor
brew install postgresql 
brew services list
brew services start postgresql
brew services list
psql -U postgres
# local user is lukehowsam for all databases 
# Run the below SQL statement
# ALTER ROLE lukehowsam WITH PASSWORD '123'; 
# running \du should result in: 

#                                    List of roles
# Role name  |                         Attributes                         | Member of 
#------------+------------------------------------------------------------+-----------
# lukehowsam | Superuser, Create role, Create DB, Replication, Bypass RLS | {}
# postgres   | Superuser                                                  | {}

