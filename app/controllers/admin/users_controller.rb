# coding: utf-8
class Admin::UsersController < Admin::Base
  def index
    @user_list = Kaminari.paginate_array(User.order(:id)).
      page(params[:page]).per(5)
  end

  def show
    @user = User.find params[:id]
  end

  def edit
    @user = User.find params[:id]
  end

  def update
    @user = User.find(params[:id])
    @user.assign_attributes(params[:user])

    if @user.save
      redirect_to [:admin, @user], notice: "ユーザー情報を更新しました"
    else
      render "edit"
    end
  end
end
