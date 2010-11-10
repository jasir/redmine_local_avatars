require_dependency 'principal' # required to avoid http://www.redmine.org/boards/2/topics/8819 "Expected ... app/models/user.rb to define User
require_dependency 'user' 

module LocalAvatarsPlugin
  module UsersAvatarPatch
    def self.included(base) # :nodoc:    
      base.class_eval do      
        #unloadable  LP: Commented since it doesn't seem to make a difference...
				acts_as_attachable
      end
    end
  end
end
User.send(:include, LocalAvatarsPlugin::UsersAvatarPatch)
