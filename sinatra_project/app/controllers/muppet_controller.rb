class MuppetController < ApplicationController
  get "/muppets/new" do
    redirect_if_not_logged_in
    erb :"muppets/new"
  end

  post "/muppets" do
    muppet = Muppet.create(name: params[:name], job: params[:job], user_id: session[:user_id])
    redirect "/muppets"
  end

  get "/muppets" do
    redirect_if_not_logged_in
    if in_session?
      @muppets = current_user.muppets
      erb :"/muppets/index"
    else
      redirect to "/login"
    end
  end

  get "/muppets/:slug" do
    redirect_if_not_logged_in
    if in_session?
      @muppet = find_slug
      erb :"muppets/show_muppet"
    else
      redirect to "/login"
    end
  end

  get "/muppets/:slug/edit" do
    redirect_if_not_logged_in
    if in_session?
      @muppet = find_slug
      erb :"muppets/edit"
    else
      redirect to "/login"
    end
  end

  patch "/muppets/:id" do
    redirect_if_not_logged_in
    @muppet = find_id
    if muppet_belongs_to_current_user
      @muppet.update(name: params[:name], job: params[:job])
    end
    redirect to "/muppets/#{@muppet.slug}"
  end

  delete "/muppets/:id/delete" do
    redirect_if_not_logged_in
    @muppet = find_id
    if muppet_belongs_to_current_user
      @muppet.delete
      redirect to "/muppets"
    else
      erb :"muppets/show_muppet"
    end
  end
end
