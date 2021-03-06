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

		redirect '/failure' if user.username == "" || user.password == ""

		if !User.where("username = ?", user.username)[0] && user.save
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
		if strong_user == nil
			redirect '/failure'
		elsif strong_user.authenticate(params[:password])
			session[:user_id] = strong_user.id
			redirect '/account'
		else
			redirect '/failure'
		end
	end

	get "/failure" do
		erb :failure
	end

	get "/account" do
		if !!session[:user_id]
			@user = User.find(session[:user_id])
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
		redirect '/failure' if hang.exercise == "" || hang.duration == ""
		hang.save
		redirect to '/account'
	end

	delete "/account" do
		Hang.where("user_id = #{session[:user_id]}").destroy_all
		redirect to '/account'
	end

	get "/remove/:hang_id" do
		redirect '/failure' if hang.user_id != session[:user_id]
		Hang.where("id = #{params[:hang_id]}").destroy_all
		redirect to '/account'
	end

	post "/signout" do
		session.clear
		redirect to '/'
	end
	
	get "/account/:hang_id" do
		@hang = Hang.find(params[:hang_id])

		if @hang.user_id != session[:user_id]
			redirect to '/account'
		end

		erb :edit
	end

	patch '/account/:hang_id' do
		hang = Hang.find(params[:hang_id])

		redirect '/failure' if hang.user_id != session[:user_id]

		!params["exercise"].empty? ? (hang.exercise = params["exercise"]) : nil
		!params["duration"].empty? ? (hang.duration = params["duration"]) : nil

		hang.save

		redirect '/account'
	end 
    
end