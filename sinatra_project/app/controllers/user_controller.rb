class Usercontroller < ApplicationController
  get "/signup" do
    if session[:user_id]
      redirect "/users/home"
    end
    erb :"users/new"
  end

  post "/signup" do
    @user = User.create(username: params[:username], password: params[:password])
    session[:user_id] = @user.id
    redirect "/users"
  end

  get "/login" do
    erb :"/users/login"
  end

  post "/login" do
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect "/users/home"
    else
      redirect "/login"
    end
  end

  get "/users/home" do
    @user = User.find_by(username: params[:username])
    erb :"users/user_page"
  end
end
