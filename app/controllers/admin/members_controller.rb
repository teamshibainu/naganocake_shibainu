class Public::MembersController < ApplicationController
  def show
    binding.pry
    @member= Member.find(params[:id])
  end

  def edit
    binding.pry
    @member = current_member
  end

  def update
    @member = current_member
    if @member.update(member_params)
      flash[:success] = "登録情報を変更しました"
      redirect_to members_path
    else
      render :edit and return
    end
  end

  private
  def member_params
    params.require(:member).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :postal_code, :address, :phone_number)
  end

end
