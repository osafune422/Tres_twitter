class UsersController < ApplicationController
  def mypage
    @user = User.find_by(id: params[:id])
  end
  
  def edit
    @user = User.find_by(id: params[:id])
  end
  
  def update
    @user = User.find_by(id: params[:id])
    @user.name = params[:name]
    @user.profile = params[:profile]
    
    if @user.save
      flash.now[:notice] = "変更記事をアップしました"
      render("users/mypage")
    else
      render("users/edit")
    end
  end
end
