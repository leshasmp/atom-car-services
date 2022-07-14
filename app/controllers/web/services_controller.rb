# frozen_string_literal: true

class Web::ServicesController < Web::ApplicationController
  def show
    @service = Service.find params[:id]
  end

  def new
    @order ||= Order.find params[:order_id]
    @service = Service.new
  end

  def create
    @order ||= Order.find params[:order_id]
    @service = @order.services.build(permitted_params)

    if @service.save
      redirect_to @order, notice: t('.success')
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def permitted_params
    params.require(:service).permit(:name)
  end
end
