class BillsController < ApplicationController
  before_action :set_bill, only: [:show, :update, :destroy]

  # GET /bills
  def index
    @bills = Bill.all
    json_response(@bills)
  end

  # POST /bills
  def create
    @bill = Bill.create!(bill_params)
    json_response(@bill, :created)
  end

  # GET /bills/:id
  def show
    json_response(@bill)
  end

  # PUT /bills/:id
  def update
    @bill.update(bill_params)
    head :no_content
  end

  # DELETE /bills/:id
  def destroy
    @bill.destroy
    head :no_content
  end

  private

  def bill_params
    # whitelist params
    params.permit(:title, :created_by)
  end

  def set_bill
    @bill = Bill.find(params[:id])
  end
end
