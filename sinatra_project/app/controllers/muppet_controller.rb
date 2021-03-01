class MuppetController < ApplicationController
  get "/muppets/new" do
    erb :"muppets/new"
  end

  post "/muppets" do
    @muppets = Muppet.create(name: params[:name], job: params[:job])
    redirect to "/muppets"
  end

  get "/muppets" do
    @muppets = Muppet.all
    erb :"/muppets/muppets"
  end

  get "/muppets/:id" do
    @muppet = Muppet.find_by(id: params[:id])
    erb :"muppets/show_muppet"
  end

  get "/muppets/:id/edit" do
    @muppet = Muppet.find_by(id: params[:id])
    erb :"muppets/edit"
  end

  patch "/muppets/:id" do
    binding.pry
    @muppet = Muppet.find_by(id: params[:id])
    @muppet.update(name: params[:name], job: params[:job])
    redirect to "/muppets/#{@muppet.id}"
  end

  delete "/muppets/:id/delete" do
    muppet = Muppet.find_by(id: params[:id])
    muppet.delete
    redirect to "/muppets"
  end
end
