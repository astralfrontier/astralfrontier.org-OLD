# config valid only for Capistrano 3.1
lock '3.2.1'

set :application, 'astralfrontier.org'
set :repo_url, 'git@github.com:astralfrontier/astralfrontier.org.git'

# Default deploy_to directory is /var/www/my_app
# set :deploy_to, '/var/www/my_app'

set :scm, :git

set :bundle_bins, fetch(:bundle_bins, []).push('thin')
