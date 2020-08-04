class DynamicPagesController < ApplicationController
  
  def home
    params[:user] = User.find(params[:id])
    params[:gossips] = Gossip.where(user_id: params[:user].id)
  end

  def user
    params[:user] = User.find(params[:id])
    params[:city] = City.find(params[:user].city_id)
    params[:nb_gossips] = Gossip.where(user_id: params[:user].id).count
    params[:nb_comments] = Gossip.where(user_id: params[:user].id).count
  end
  
end
