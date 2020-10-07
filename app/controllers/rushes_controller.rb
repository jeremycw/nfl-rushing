require 'csv'

include RushesService

class RushesController < ApplicationController
  def index
    @index_params = params.permit(:order, :order_by, :name, :page)
    rushes = processed_rushes(@index_params)
    respond_to do |fmt|
      fmt.html do
        @page_metadata = page_metadata(@index_params, rushes)
        @rushes = paged_rushes(@index_params, rushes)
      end
      fmt.csv { render plain: to_csv(rushes.all) }
    end
  end
end
