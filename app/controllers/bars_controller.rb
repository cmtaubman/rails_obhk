class BarsController < ApplicationController
  before_action :set_bar

  def index
    @bars = Bar.all
  end


# GET /bars/1
  # GET /bars/1.json
  def show
  end


  private
  # Use callbacks to share common setup or constraints between actions.
  def set_bar
    @bar = Bar.find(params[:id])
  end

end