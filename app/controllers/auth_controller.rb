class AuthController < ApplicationController

	def github
		#coordinate the params being passed into the github class
		github = Github.new(params)
		@user = User.find_or_create_by_auth(github)
		render json: { 
			token: Token.encode(@user.id), 
			user: {
				username: @user.username,
				email: @user.email,
				avatar: @user.avatar,
				company: @user.company
	 			url: @user.url
	 			blog: @user.blog
	 			location: @user.location
	 			follower_count: @user.followers
	 			following_count: @user.following
	 			public_gists: @user.public_gists
	 			hireable: @user.hireable
			}
		}
	end

end