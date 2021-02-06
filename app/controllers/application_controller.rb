require "./config/environment"
require "./app/models/user"
require "./app/models/hang"
class ApplicationController < Sinatra::Base

    configure do
		set :views, "app/views"
		enable :sessions
		set :session_secret, "password_security"
    end

    get '/' do
        erb :home
    end

    get '/signup' do
        erb :signup
    end

	post "/signup" do
		user = User.new(username: params[:username], password: params[:password])

		if user.save
			redirect '/login'
		else
			redirect '/failure'
		end
	end

	get "/login" do
		erb :login
	end

	post '/login' do
		strong_user = User.find_by(username: params[:username])

		if strong_user.authenticate(params[:password])
			session[:user_id] = strong_user.id
			redirect '/account'
		else
			"failure"#redirect '/failure'
		end
	end

	get "/account" do
		if !!session[:user_id]
			#binding.pry
			@user = User.find(session[:user_id])
			#binding.pry
			erb :account
		else
			redirect "/login"
		end
	end

	post "/account" do
		@user = User.find(session[:user_id])
		hang = Hang.new(
			exercise: params[:exercise],
			duration: params[:duration],
			user_id: session[:user_id],
			time: Time.now
		)
		hang.save
		#binding.pry
		erb :account
	end
    
end