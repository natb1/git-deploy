provides :git_deploy

actions :sync
default_action :sync

attribute :destination, :kind_of => String, :name_attribute => true
attribute :repository, :kind_of => String
attribute :revision, :kind_of => String
