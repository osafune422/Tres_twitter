class UsersController < ApplicationController
  def mypage
    @user = User.find_by(id: params[:id])
  end
  
  def new
    @user = User.new
  end  
  
  def create
    @user = User.new(
      login_id: params[:login_id], 
      password: params[:password],
      name: params[:name]
      )

    if @user.save
      session[:user_id]=@user.id
      flash[:notice] = "ユーザー登録が完了しました"
      redirect_to("/mypage/#{@user.id}/#{@user.login_id}")
    else
      render("users/new")
    end
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
