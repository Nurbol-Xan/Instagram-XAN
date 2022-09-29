class PagesController < ApplicationController
  def home
    if !account_signed_in?
      redirect_to new_account_session_path
    end
  end
end
