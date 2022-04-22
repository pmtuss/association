class CardsController < ApplicationController
  def show
    @card = Card.find(params[:id])
  end

  def edit
    @user = User.find(params[:user_id])
  end
end
