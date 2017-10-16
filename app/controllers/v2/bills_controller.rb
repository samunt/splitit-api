# app/controllers/v2/billss_controller.rb
class V2::BillsController < ApplicationController
  def index
    json_response({ message: 'Hello there'})
  end
end
