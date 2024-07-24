class ProductsController < ApplicationController
  rescue_from ActiveRecord::RecordInvalid, with: :unprocessable_entity
  before_action :authorize
  before_action :find_product, only: [:show, :update, :destroy]

  def index
    @products = Product.all
    if @products
      render json: @products, status: :accepted
    else
      render json: { message: "No products yet:)" }, status: :unprocessable_entity
    end
  end

  def show
    if @product
      render json: @product, status: :accepted
    else
      render json: @product.errors, status: :not_found
    end
  end

  def create
    @product = Product.create(product_params)
    if @product.save
      render json: @product, status: :created
    else
      render json: { message: "Cannot create product, try later" }
    end
  end

  def update
    if product_params[:status] == "Available"
      @product.user_id = nil
    end

    if @product.update(product_params)
      render json: @product, status: :accepted
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @product.destroy!
    head :no_content
  end

  private

  def find_product
    @product = Product.find_by(id: params[:id])
  end

  def product_params
    params.require(:product).permit(:serial_number, :category, :name, :unit_price, :date_bought, :status, :user_id)
  end

  def authorize
    return head :no_content unless session[:admin_id]
  end
end
