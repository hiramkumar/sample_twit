class Post < ActiveRecord::Base
    belongs_to :user
	def self.by_user(user)
		following = Friend.find(:all,:conditions => ["my_id = ? and friend_type = ?",user,'Following'])
		friend = []
		following.each{|fr| friend << fr.friend_id}
		post = Post.find(:all,:conditions => ["user_id in (?)",friend.uniq])
	end
end
