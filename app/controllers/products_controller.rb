class ProductsController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :unprocessable_entity

    before_action :find_product, only: [:show, :update, :destroy]

    def index
        @products = Product.all
        if @products
        render json: @products, status: :accepted
        else
        render json: {message: "No products yet:)"}, status: :unprocessable_entity
        end
    end

    
    private

    def find_product
        @product = Product.find_by(id: params[:id])
    end

    def product_params
        params.require(:product).permit(:serial_number, :category, :name, :unit_price, :date_bought, :status, :user_id)
    end

end