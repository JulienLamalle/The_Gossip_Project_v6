class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @user_city = City.find(@user.city_id)
    @user_gossip_count = Gossip.where(user_id: @user.id).count
  end

end