class FollowsController < ApplicationController
  before_action :authenticate_account!

  def create
    @account = Account.find(params[:account_id])
    @follow = @account.follows.create(fol_params)
    @following = current_account.followings.build(fol_params)
    @following.id = @follow.id
    @follow.account = @account  
    
    if @follow.save && @following.save
      flash[:alert] = "Good #{@following.id}, #{@follow.id}"
      respond_to :js
    else
      flash[:alert] = "Something went wrong ...#{@following.id}, #{@follow.id}"
    end
    
  
  end

  def destroy
    @follow = Follow.find(params[:id])
    @following = Following.find(params[:id])
    @account = @follow.account
    if @follow.destroy && @following.destroy
      flash[:alert] = "Good destroy #{@following.id}, #{@follow.id}"
      respond_to :js
    else
      flash[:alert] = "Something went wrong ..."
    end
  end

  private
  
  def fol_params
    params.permit :account_id
  end
end
