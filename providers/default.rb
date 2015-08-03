provides :git_deploy

action :sync do
  package 'git'

  file "/opt/deploy_key" do
    mode "0400"
    content node['deploy']['key']
    sensitive true
    owner node.deploy.user
    group node.deploy.user
  end
  
  file "/opt/gitssh" do
    mode "0550"
    content <<-eos
      #!/bin/sh
      exec /usr/bin/ssh -o StrictHostKeyChecking=no -i /opt/deploy_key "$@"
    eos
    owner node.deploy.user
    group node.deploy.user
  end

  directory new_resource.name do
    user node.deploy.user
    group node.deploy.user
  end

  execute 'git the repo' do
    command "GIT_SSH=/opt/gitssh git clone -b #{new_resource.revision} #{new_resource.repository} #{new_resource.name}"
    user node.deploy.user
    group node.deploy.user
    creates new_resource.name
  end

end
