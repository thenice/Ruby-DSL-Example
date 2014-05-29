require('./Component')
require('./ComponentHelpers')

component = Component.new

component.install :package_name => "Slider", :package_version => 2.0, :package_manager => "cocoapods" do
  git_clone "repo url"
  shell "ls"
end

component.post_install :package_name => "Slider", :package_version => 2.0, :package_manager => "cocoapods" do
  puts "Post install time!"
end

component.uninstall :package_name => "Slider", :package_version => 2.0, :package_manager => "cocoapods" do
  puts "Uninstalling"
end

component.actions[:install].call
