class Usercontroller < ApplicationController
  get "/signup" do
    erb :"users/new"
  end

  post "/signup" do
    @user = User.create(username: params[:username], password: params[:password])
    redirect "/users"
  end

  get "/login" do
    erb :"/users/login"
  end

  post "/login" do
    redirect "/users/home"
  end

  get "/users/home" do
    @user = User.find_by(username: params[:username])
    erb :"users/user_page"
  end
end
