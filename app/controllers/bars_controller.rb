class BarsController < ApplicationController
  def index
    @bars = Bar.all
  end


# GET /bars/1
  # GET /bars/1.json
  def show
  end

end