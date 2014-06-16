class Profile < ActiveRecord::Base
    belongs_to :adminuser, :dependent => :destroy
end
