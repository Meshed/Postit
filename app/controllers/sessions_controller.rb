class SessionsController < ApplicationController
	def new
	end

	def create
		user = login(params[:username], params[:password])		

		if user
			redirect_back_or_to root_path, :notice => "Logged in!"
		else
			flash.now.alert = "Email or password was invalid"
			render :new
		end
	end

	def destroy
		logout
		redirect_to root_path :notice => "Logged out"
	end
end