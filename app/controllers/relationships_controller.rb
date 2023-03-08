class RelationshipsController < ApplicationController
  # before_action :set_user, only: [:followings, :followers]

  # フォローするとき
 def create
   user = User.find(params[:user_id])
   current_user.follow(user)
  # @users = current_user
   redirect_to request.referer
 end
# フォロー外すとき
 def destroy
   user = User.find(params[:user_id])
   current_user.unfollow(user)
   @users = current_user
   redirect_to request.referer
 end
# フォロー一覧
 def followings
   user = User.find(params[:user_id])
   @user = user.followings
 end
# フォロワー一覧
 def followers
   user = User.find(params[:user_id])
   @users = user.followers
 end
 
# private
#   def set_user
#     @user = User.find(params[:id])
#   end
  
end
