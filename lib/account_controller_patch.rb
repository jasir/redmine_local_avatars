require_dependency 'account_controller'
require 'local_avatars'

module LocalAvatarsPlugin
	module AccountControllerPatch

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
		end
	end
end

AccountController.send(:include, LocalAvatarsPlugin::AccountControllerPatch)
