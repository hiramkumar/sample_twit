class Friend < ActiveRecord::Base
	validates_presence_of :my_id,:friend_id,:friend_type
		def self.create_friend(user,friend)
		type = "Following"
		new_friend = self.new(:my_id => user.to_i,:friend_id => friend.to_i,:friend_type => type)
		new_friend.save!
		new_friend
	end
end
