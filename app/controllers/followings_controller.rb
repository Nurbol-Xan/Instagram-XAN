class FollowingsController < ApplicationController
  before_action :authenticate_account!

  def create
    @following = current_account.follows.build(fol_params)
    @account = @following.account
    @account.id = current_account.id
    if @following.save
      flash[:alert] = "Good"
      respond_to :js
    else
      flash[:alert] = "Something went wrong ..."
    end
  end

  def destroy
    @following = Following.find(params[:id])
    @account = @following.account
    @account.id = current_account.id
    if @following.destroy
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
