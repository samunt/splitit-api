class BilledsController < ApplicationController
  before_action :set_bill
  before_action :set_bill_billed, only: [:show, :update, :destroy]

  # GET /bills/:bill_id/billeds
  def index
    json_response(@bill.billeds)
  end

  # GET /bills/:bill_id/billeds/:id
  def show
    json_response(@billed)
  end

  # POST /bills/:bill_id/billeds
  def create
    @bill.billeds.create!(billed_params)
    json_response(@bill, :created)
  end

  # PUT /bills/:bill_id/billeds/:id
  def update
    @billed.update(billed_params)
    head :no_content
  end

  # DELETE /bills/:bill_id/billeds/:id
  def destroy
    @billed.destroy
    head :no_content
  end

  private

  def billed_params
    params.permit(:firstName, :lastName, :done)
  end

  def set_bill
    @bill = bill.find(params[:bill_id])
  end

  def set_bill_billed
    @billed = @bill.billeds.find_by!(id: params[:id]) if @bill
  end
end
