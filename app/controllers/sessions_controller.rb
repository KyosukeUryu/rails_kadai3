class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      redirect_to root_path, success: 'ログインしました'
    else
      render :new, danger: 'ログインできませんでした'
    end
  end

  def destroy
  end
end
