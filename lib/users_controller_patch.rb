require_dependency 'users_controller'
require 'local_avatars'

module LocalAvatarsPlugin
	module UsersControllerPatch

		def self.included(base) # :nodoc:
			base.class_eval do
				unloadable
				helper :attachments
				include AttachmentsHelper 
			end

			base.send(:include, InstanceMethods)
		end

		module InstanceMethods
			include LocalAvatars

			def get_avatar
				@user = User.find(params[:id])
				send_avatar(@user)
			end

			def save_avatar
				@user = User.find(params[:id])

				begin
					save_or_delete # see the LocalAvatars module
				rescue
					flash[:error] = @possible_error
				end
				redirect_to :action => 'edit', :id => @user
			end
		end
	end
end

UsersController.send(:include, LocalAvatarsPlugin::UsersControllerPatch)
