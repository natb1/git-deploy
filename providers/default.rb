provides :git_deploy

action :sync do
  package 'git'

  file "/opt/deploy_key" do
    mode "0400"
    content node['deploy']['key']
    sensitive true
    owner node['deploy']['user']
    group node['deploy']['user']
  end
  
  file "/opt/gitssh" do
    mode "0550"
    content <<-eos
      #!/bin/sh
      exec /usr/bin/ssh -o StrictHostKeyChecking=no -i /opt/deploy_key "$@"
    eos
    owner node['deploy']['user']
    group node['deploy']['user']
  end

  directory new_resource.name do
    user node['deploy']['user']
    group node['deploy']['user']
  end

  git new_resource.name do
    repository new_resource.repository
    revision new_resource.revision
    ssh_wrapper '/opt/gitssh'
    user node['deploy']['user']
    group node['deploy']['user']
  end
  
end
