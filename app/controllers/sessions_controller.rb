class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(mail: params[:session][:mail].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      flash[:success] = 'ログインに成功しました'
      redirect_to root_path
    else
      flash.now[:danger] = 'メールアドレスとパスワードが間違っています'
      render 'new'
    end
  end

  def destroy
    log_out
    flash[:success] = 'ログアウトに成功しました'
    redirect_to root_url
  end
end
