module V1
  class ItemsController < ApplicationController
    before_action :set_bill
    before_action :set_bill_item, only: [:show, :update, :destroy]

    # GET /bills/:bill_id/items
    def index
      json_response(@bill.items)
    end

    # GET /bills/:bill_id/items/:id
    def show
      json_response(@item)
    end

    # POST /bills/:bill_id/items
    def create
      @bill.items.create!(item_params)
      json_response(@bill, :created)
    end

    # PUT /bills/:bill_id/items/:id
    def update
      @item.update(item_params)
      head :no_content
    end

    # DELETE /bills/:bill_id/items/:id
    def destroy
      @item.destroy
      head :no_content
    end

    private

    def item_params
      params.permit(:name, :cost)
    end

    def set_bill
      @bill = Bill.find(params[:bill_id])
    end

    def set_bill_item
      @item = @bill.items.find_by!(id: params[:id]) if @bill
    end
  end
end
