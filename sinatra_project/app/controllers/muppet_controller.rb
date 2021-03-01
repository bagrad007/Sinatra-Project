class MuppetController < ApplicationController
  get "/muppets/new" do
    erb :"muppets/add_muppet"
  end

  post "/muppets" do
    @muppets = Muppet.create(name: params[:name], job: params[:job])
    binding.pry
    redirect to "/muppets"
  end

  get "/muppets" do
    @muppets = Muppet.all
    erb :"/muppets/muppets"
  end
end
