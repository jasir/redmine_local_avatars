require 'redmine'

module RedmineLocalAvatars
  class Hooks < Redmine::Hook::ViewListener
		# This just renders the partial in
		# app/views/hooks/redmine_local_avatars/_view_my_account_contextual.rhtml
		render_on :view_my_account_contextual,
		           :partial => 'hooks/redmine_local_avatars/view_my_account_contextual'
  end
end
