class ProductsController < ApplicationController
    before_action :authorize

    def index

    end

    def show

    end

    def create
      
    end

    def update

    end

    def destroy

    end

    private

    def find_product
        @product = Product.f
    end

    def product_params
        params.require(:product).permit(:serial_number, :category, :name, :unit_price, :date_bought, :status, :user_id)
    end
end
