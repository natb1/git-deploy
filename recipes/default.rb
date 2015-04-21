#
# Cookbook Name:: git-deploy
# Recipe:: default
#
# Copyright (C) 2015 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

git_deploy '/opt/dev-infrastructure' do
  repository 'git@github.com:natb1/dev-infrastructure.git'
end

