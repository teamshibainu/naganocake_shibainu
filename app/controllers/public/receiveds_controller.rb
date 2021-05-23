class Public::ReceivedsController < ApplicationController
  def index
    @received = Received.new
    @receiveds = current_member.receiveds
  end

  def edit
    @received = Received.find(params[:id])
  end

  def create
    @received = Received.new(received_params)
    @received.member_id = current_member.id
    @receiveds = current_member.address
    if @received.save
      flash.now[:notice] = "新規配送先を登録しました"
      redirect_to public_receiveds_path
    else
      render "index"
    end
  end

  def update
    @received = Received.find(params[:id])
    if @received.update(received_params)
      flash[:success] = "配送先を変更しました"
      redirect_to public_receiveds_path
    else
      render :edit
    end
  end

  def destroy
     @received = Received.find(params[:id])
    if@received.destroy
      @received = current_member.address
      redirect_to public_receiveds_path, notice:"配送先を削除しました。"
    else
      render :index
    end
  end

  private

  def received_params
    params.require(:received).permit(:postal_code, :street_address, :name)
  end
end

