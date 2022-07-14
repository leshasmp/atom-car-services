# frozen_string_literal: true

class Web::OrdersController < Web::ApplicationController
  def index
    @orders = Order.all
  end

  def show
    @order = Order.find params[:id]
    @services = @order.services.order('created_at DESC')
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(permitted_params)

    if @order.save
      redirect_to root_path, notice: t('.success')
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @order = Order.find params[:id]
  end

  def update
    @order = Order.find params[:id]

    if @order.update(permitted_params)
      redirect_to root_path, notice: t('.success')
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @order = Order.find(params[:id])

    if @order.destroy
      redirect_to orders_path, notice: t('.success')
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def permitted_params
    params.require(:order).permit(:customer_name)
  end
end
