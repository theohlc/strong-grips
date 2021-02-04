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
			"success"#redirect '/success'
		else
			"failure"#redirect '/failure'
		end
	end
    
end