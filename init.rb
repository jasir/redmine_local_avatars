require 'redmine'

# patches to Redmine
require_dependency "account_controller_patch.rb"
require_dependency "application_helper_avatar_patch.rb"
require_dependency "my_controller_patch.rb"
require_dependency "users_avatar_patch.rb"   # User model
require_dependency "users_controller_patch.rb"
require_dependency "users_helper_avatar_patch.rb"  # UsersHelper

# hooks
require_dependency 'redmine_local_avatars/hooks'

Redmine::Plugin.register :redmine_local_avatars do
  name 'Redmine Local Avatars plugin'
  author 'A. Chaika and others'
  description 'This is a plugin for Redmine'
	version '0.0.3'
end

if RAILS_ENV == 'development' then
  ActiveSupport::Dependencies.load_once_paths.reject!{|x| x =~ /^#{Regexp.escape(File.dirname(__FILE__))}/}
end
