class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @user_city = City.find(@user.city_id)
    @user_gossip_count = Gossip.where(user_id: @user.id).count
  end

  def new
    @new_user = User.new 
  end

  def Create  
    @new_user = User.new(first_name: params[:first_name], last_name: params[:last_name], age: params[:age], email: params[:email], password: params[:password], description: params[:description])
  end

end