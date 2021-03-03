require "./config/environment"

class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, "public"
    set :views, "app/views"
    enable :sessions
    set :session_secret, "muppetshow"
  end

  get "/" do
    erb :index
  end

  helpers do
    def in_session?
      session[:user_id]
    end

    def current_user
      User.find_by(id: session[:user_id])
    end

    def find_slug
      Muppet.find_by_slug(params[:slug])
    end

    def find_id
      Muppet.find_by(id: params[:id])
    end

    def muppet_belongs_to_current_user
      @muppet && @muppet.user_id == current_user.id
    end

    def redirect_if_not_logged_in
      redirect "/login" unless current_user
    end
  end
end
