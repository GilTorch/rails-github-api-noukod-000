class RepositoriesController < ApplicationController


  def index
    resp=Faraday.get "https://api.github.com/user" do |req|
      req.headers['Authorization']= 'token '+ session[:token]
      req.headers['Accept']='application/json'
    end
    @body=JSON.parse(resp.body)

    resp=Faraday.get "https://api.github.com/#{@body.login}/repos" do |req| 
      req.headers["Authorization"]='token '+session[:token]
      req.headers["Accept"]='application/json'
    end
  end


end
