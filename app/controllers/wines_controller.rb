class WinesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :create, :update, :destroy]
  before_action :set_wine, only: [:show, :edit, :update, :destroy]

  def index
    @wines = Wine.where(availability: true)
  end

  def show
  end

  def new
    @wine = Wine.new
  end

  def edit
  end

  def create
    @wine = current_user.wines.new(wine_params)
      if @wine.save
        redirect_to @wine, notice: 'Wine was successfully created.'
      else
        render :new
      end
  end

  def update
      if @wine.update(wine_params)
        redirect_to @wine, notice: 'Wine was successfully updated.'
      else
        render :edit
      end
  end

  def destroy
    @wine.destroy
      redirect_to wines_path, notice: 'Wine was successfully destroyed.'
  end


  private
    def set_wine
      @wine = Wine.find(params[:id])
    end

    def wine_params
      params.require(:wine).permit(:name, :description, :price, :availability)
    end
end
