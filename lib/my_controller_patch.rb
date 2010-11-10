require_dependency 'my_controller'
require 'local_avatars'

module LocalAvatarsPlugin
	module MyControllerPatch
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

			def avatar
				@user = User.current
				render :partial => 'users/avatar', :layout => true
			end

			def save_avatar
				@user = User.current
puts("MyControllerPatch#save_avatar")
				begin
					save_or_delete # see the LocalAvatars module
					puts("out of save_or_delete")
					redirect_to :action => 'account', :id => @user
				rescue
					puts("in catch block")
					flash[:error] = @possible_error
					redirect_to :action => 'avatar'
				end
			end
		end # InstanceMethods
  end
end
MyController.send(:include, LocalAvatarsPlugin::MyControllerPatch)
