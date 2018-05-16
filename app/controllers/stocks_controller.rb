class StocksController < ApplicationController

  def search
    if params[:stock].blank?
      flash.now[:danger] = "Symbol not found"
    else
      @stock = Stock.new_from_lookup(params[:stock])
      flash.now[:danger] = "Enter a symbol" unless @stock
    end

    respond_to do |format|
      format.js { render partial: 'users/result' }
    end
  end

end
