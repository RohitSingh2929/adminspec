class BreweriesController < ApplicationController
    def index
      @breweries = Brewery.all
    end

    def count
      @count = Brewery.count
      render json: { count: @count }
    end
end