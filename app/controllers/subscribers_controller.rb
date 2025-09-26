class SubscribersController < ApplicationController
    allow_unauthenticated_access
    before_action :set_product

    def create
        @product.subscribers.where(subsciber_params).first_or_create
        redirect_to @product, notice: "You are now subscibed."
    end

    private

    def set_product
        @product = Product.find(params[:product_id])
    end

    def subsciber_params
        params.expect(subscriber: [ :email ])
    end
end
