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
    @user = User.find_by(:username => params[:username])
    redirect "/users/show"
  end

  get "/users/show" do
    binding.pry
    @user = User.find_by(:username => params[:username])
    erb :"users/show"
  end
end
