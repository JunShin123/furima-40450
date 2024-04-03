class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_order
  before_action :soldout_move_to_index

  def index
    @buyer_history = BuyerHistory.new
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
  end

  def create
    @buyer_history = BuyerHistory.new(buyer_history_params)
    if @buyer_history.valid?
      pay_item
      @buyer_history.save
      redirect_to root_path
    else
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      render :index, status: :unprocessable_entity
    end
  end

  private

  def buyer_history_params
    params.require(:buyer_history).permit(:postal_code, :prefecture_id, :city, :street, :building, :phone_number).merge(item_id: @item.id, user_id: current_user.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,
        card: buyer_history_params[:token],
        currency: 'jpy'
      )
  end

  def set_order
    @item = Item.find(params[:item_id])
  end

  def soldout_move_to_index
    redirect_to root_path if @item.history.present?
  end
end