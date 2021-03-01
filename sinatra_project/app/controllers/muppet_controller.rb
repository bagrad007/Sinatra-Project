class MuppetController < ApplicationController
  get "/muppets/muppets" do
    erb :"muppets/all_muppets"
  end
end
