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
      name: params[:name],
      icon_name: "default.jpg",
      header_name: "noimage.jpg"
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
    
    if params[:icon_name]
      @user.icon_name = "#{@user.login_id}_icon.jpg"
      icon = params[:icon_name]
      File.binwrite("public/icon/#{@user.icon_name}", icon.read)
    end
    if params[:header_name]
      @user.header_name = "#{@user.login_id}_header.jpg"
      header = params[:header_name]
      File.binwrite("public/header/#{@user.header_name}", header.read)
    end
    
    if @user.save
      flash.now[:notice] = "アカウント情報を変更しました"
      render("users/mypage")
    else
      render("users/edit")
    end
  end
  
  def login_form
    
  end
  
  def login
    @user=User.find_by(login_id: params[:login_id], password: params[:password])
   
    if @user
      session[:user_id]=@user.id
      flash[:notice]="ログインしました"
      redirect_to("/mypage/#{@user.id}/#{@user.login_id}")
    else
      @error_message="ログインIDまたはパスワードが間違っています"
      @login_id=params[:login_id]
      @password=params[:password]
      render("users/login_form")
    end
  end
  
  def logout
    session[:user_id]=nil
    flash[:notice]="ログアウトしました"
    redirect_to("/login")
  end
end
