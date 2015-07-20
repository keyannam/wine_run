class TransactionsController < ApplicationController

  def create
    wine = Wine.find_by!(slug: params[:slug])
    sale = wine.sales.create(
      amount: wine.price,
      buyer_email: current_user.email,
      seller_email: wine.user.email,
      stripe_token: params[:stripeToken])
  sale.process!
  if sale.finished?
    redirect_to pickup_url(guid: sale.guid), notice: "Transaction Successful"
  else
    redirect_to wine_path(wine), notice: "Something went wrong"
  end
end

  def pickup
    @sale = Sale.find_by!(guid: params[:guid])
    @wine = @sale.wine
  end
end
