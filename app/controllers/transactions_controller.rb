class TransactionsController < ApplicationController

  def create
    wine = Wine.find_by!(slug: params[:slug])
    token = params[:stripeToken]

    begin
      charge = Stripe::Charge.create(
        amount: wine.price,
        currency: "usd",
        card: token,
        description: current_user.email)
      @sale = wine.sales.create!(
        buyer_email: current_user.email)
      redirect_to pickup_url(guid: @sale.guid)
    rescue Stripe::CardError => e
      @error = e
      redirect_to wine_path(book), notice: @error
    end
  end

  def pickup
    @sale = Sale.find_by!(guid: params[:guid])
    @wine = @sale.wine
  end
end
