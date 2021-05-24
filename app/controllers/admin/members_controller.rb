class Public::MembersController < ApplicationController
  def show
    @member= Member.find(params[:id])
  end

  def edit
    @member = current_member
  end

  def update
    @member = current_member
    if @member.update(member_params)
      redirect_to members_path, notice:"ユーザー情報を変更しました。"
    else
      render :edit
    end
  end

  private
  def member_params
    params.require(:member).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :postal_code, :address, :phone_number)
  end

end
