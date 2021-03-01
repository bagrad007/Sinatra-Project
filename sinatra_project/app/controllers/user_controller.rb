class Usercontroller < ApplicationController
  get "/signup" do
    erb :"users/new"
  end

  post "/muppets" do
  end
end
