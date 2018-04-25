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
    @post.profile = params[:profile]
    
    if @post.save
      flash[:notice] = "変更記事をアップしました"
      redirect_to("/mypage/#{@user.id}/#{@user.login_id}")
    else
      render("users/edit")
    end
  end
end
