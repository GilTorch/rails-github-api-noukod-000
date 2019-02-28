class RepositoriesController < ApplicationController


  def index
    resp=Faraday.get "https://api.github.com/user" do |req|
      req.headers['Authorization']= 'token '+ session[:token]
      req.headers['Accept']='application/json'
    end
    @body=JSON.parse(resp.body)
    @username=@body["login"]
    url="https://api.github.com/users/#{@username}/repos/"
    puts url
    resp1=Faraday.get "https://api.github.com/users/#{@username}/repos/" do |req|
      req.headers['Accept']='application/json'
    end

  end


end
