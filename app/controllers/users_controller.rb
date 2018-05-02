class UsersController < ApplicationController
  before_action :authenticate_user, {only:[:edit]}       #ログインなしの時
  before_action :forbid_login_user, {only:[:new, :create, :login_form, :login]}       #ログインありの時
  before_action :ensure_correct_user, {only:[:edit, :update]}      #ユーザーのidが異なる時
  
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
      flash[:notice] = "アカウント情報を変更しました"
      redirect_to("/mypage/#{@user.id}/#{@user.login_id}")
    else
      render("users/edit")
    end
  end
  
  def login_form
    
  end
  
  def login
    @user=User.find_by(login_id: params[:login_id])
   
    if @user && @user.authenticate(params[:password])
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
    redirect_to("/login")
  end
  
  def ensure_correct_user
    if @current_user.id != params[:id].to_i
      flash[:notice] = "権限がありません"
      redirect_to("/mypage/#{@current_user.id}/#{@current_user.login_id}")
    end
  end
end
