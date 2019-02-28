class RepositoriesController < ApplicationController


  def index
    resp=Faraday.get "https://api.github.com/user" do |req|
      req.headers['Authorization']= 'token '+ session[:token]
      req.headers['Accept']='application/json'
    end
    @body=JSON.parse(resp.body)
    @username=@body["login"]
    resp1=Faraday.get "https://api.github.com/repos/#{@username}" do |req|
      req.headers['Authorization']= 'token '+ session[:token]
      req.headers['Accept']='application/json'
      req.params[:username]=@username
    end
    puts resp1.inspect
  end


end
