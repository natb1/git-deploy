#
# Cookbook Name:: git-deploy
# Recipe:: default
#
# Copyright (C) 2015 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

git_deploy '/opt/git-deploy' do
  repository 'git@github.com:natb1/git-deploy.git'
  revision 'master'
end

