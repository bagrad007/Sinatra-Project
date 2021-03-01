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
    # binding.pry
    @muppet = Muppet.find_by(id: params[:id])
    erb :"muppets/show_muppet"
  end
end
