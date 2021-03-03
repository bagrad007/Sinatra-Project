class Usercontroller < ApplicationController
  get "/signup" do
    if in_session?
      redirect "/users/home"
    else
      erb :"users/new"
    end
  end

  post "/signup" do
    user = User.create(username: params[:username], password: params[:password])
    if user
      session[:user_id] = user.id
      redirect "/users/home"
    else
      erb :"users/new"
    end
  end

  get "/login" do
    if in_session?
      erb :"/users/user_page"
    else
      erb :"users/login"
    end
  end

  post "/login" do
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect "/users/home"
    else
      redirect "/login"
    end
  end

  get "/users/home" do
    redirect_if_not_logged_in
    if in_session?
      @user = User.find_by(id: session[:user_id])
      erb :"users/user_page"
    else
      redirect to "/login"
    end
  end

  get "/logout" do
    session.clear
    redirect "/login"
  end
end
