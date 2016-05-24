class TweetsController < ApplicationController
  before_action :set_user

  def index
    unless cookies[:user]
      flash[:notice] = "Informe seu e-mail para começar"
      redirect_to :back
    end
  end

  private

  def set_user
    cookies[:user] = params[:email] unless params[:email].blank?
  end
end
