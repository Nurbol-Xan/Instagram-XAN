class SavedsController < ApplicationController
  before_action :authenticate_account!

  def create
    @saved = current_account.saveds.build(saved_params)
    if @saved.save
      @post = @saved.post
      @is_saved = @saved
      respond_to :js
    else
      flash[:alert] = "Something went wrong ..."
    end
  end

  def destroy
    @saved = Saved.find(params[:id])
    @post = @saved.post
    if @saved.destroy
      respond_to :js
    else
      flash[:alert] = "Something went wrong ..."
    end
  end

  private
  
  def saved_params
    params.permit(:account_id, :post_id)
  end
end
