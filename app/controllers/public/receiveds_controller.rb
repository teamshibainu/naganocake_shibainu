class Public::ReceivedsController < ApplicationController
  def index
    #@received = current_member.address
    @received = Received.new
    @receiveds = current_member.receiveds
  end

  def edit
    @received = Receiveds.find(params[:id])
  end

  def create
    @received = Received.new(receiveds_params)
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
      render "edit"
    end
  end

  def destroy
     @received = Received.find(params[:id])
    if@received.destroy
      @received = current_member.address
      flash.now[:alert] = "配送先を削除しました"
      redirect_to public_receiveds_path
    else
      render "index"
    end
  end

  private

  def receiveds_params
    params.require(:received).permit(:postal_code, :street_address, :name)
  end
end

