class LoginController < ApplicationController

	def login

	end

	def check_user
      user = User.authenticate(params[:user][:name], params[:user][:password])
        if user
          session[:user_id] = user.id
          redirect_to :action => "show_all" 
        else  
          flash.now[:notice] = "Invalid user/password combination"
          redirect_to :action => "login" 
        end
	end

	def create_user
		@user = User.new
	end

	def create
		@person = User.new(params[:user])
		@person.save
		if @person
			session[:user_id] = @person.id
			flash[:message] = 'User has been create Successfully'
			redirect_to :action => 'show_all'
		else
			redirect_to :action => 'login'
		end  
	end

	def show_all
		friend =  []
		Friend.find_all_by_my_id(session[:user_id]).each{|fr|friend << fr.friend_id}
		friend << session[:user_id]
		@users = User.find(:all,:conditions => ["id not in (?)",friend])
	end

	def create_follow
		friend = Friend.create_friend(session[:user_id],params[:user_id])
		user = User.find(session[:user_id]).user_name
		if friend
			flash[:message] = "You are following '#{user}'"
			redirect_to :action => 'show_post'		
		end
	
	end

	def own_post
		@posts = Post.find_all_by_user_id(session[:user_id])
	end

	def show_post
		@posts = Post.by_user(session[:user_id])
	end

    def retwit
    	post = Post.new(:message => params[:msg],:user_id => session[:user_id],:msg_type => 'Retwitt')
    	post.save!
    	redirect_to :action => 'show_post'
    end

	def create_own_post
		if params[:checked] == 'yes'
			msg_type = 'Public'
		else
			msg_type = 'Private'
		end
		post = Post.new(:message => params[:post],:user_id => session[:user_id],:msg_type => msg_type)
		post.save!
		@posts = Post.find_all_by_user_id(session[:user_id])
		render :layout=>false
	end

	def logout
		session[:user_id] = nil
		redirect_to :action => 'login'
	end
end
