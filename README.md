# git-deploy

LWRP to remove some of the overhead of a git deployment

## Supported Platforms

tested on Ubuntu 1404

## Attributes

<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['deploy']['user']</tt></td>
    <td>str</td>
    <td>owner of the local repo</td>
    <td><tt>In Vagrant this is set to `vagrant`.</tt></td>
  </tr>
  <tr>
    <td><tt>['deploy']['key']</tt></td>
    <td>str</td>
    <td>deploy key for the repo</td>
    <td><tt>In Vagrant this is set to ENV['DEPLOY_KEY']</tt></td>
  </tr>
</table>

## Usage



### git_deploy LWRP

Use just like the git resource except git_deploy will handle much of the
permissions and ssh overhead.

```ruby
git_deploy "/opt/somepath" do
  repository "git@github.com:someuser/somerepo.git"
  revision "somebranch"
end
```

## License and Authors

Author:: YOUR_NAME (<YOUR_EMAIL>)
