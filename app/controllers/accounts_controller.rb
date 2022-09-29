class AccountsController < ApplicationController
    def index
        @accounts = Account.search(params[:term])
        respond_to :js
        @accounts = Account.includes(:follows)
       
    end
    
    def show
        @account = Account.find(params[:id])
        @foll = @account.follows
        @is_follow = @account.is_follow(current_account)
        @posts = @account.posts.includes(:photos, :likes, :comments)
        @saved_post = Post.joins(:saveds).where("saveds.account_id=?", current_account.id).
        includes(:photos, :likes, :comments) if @account == current_account
    end
end