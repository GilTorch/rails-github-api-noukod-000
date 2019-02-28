class RepositoriesController < ApplicationController


  def index
    resp=Faraday.get "https://api.github.com/user" do |req|
      req.params['access_token']="token #{session[:token]}"
      req.headers['Accept']='application/json'
    end
    
    @body= JSON.parse(resp.body)
    puts @body.inspect
  end


end
