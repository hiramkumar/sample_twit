class User < ActiveRecord::Base
  validates_presence_of :name
  validates_presence_of :user_name
  validates_uniqueness_of :user_name
  validates_confirmation_of  :password

  def self.authenticate(name, password)
    user = self.find_by_user_name(name)
    if user
        if user.password != password
        user = nil
      end
    end
    user
  end
end
