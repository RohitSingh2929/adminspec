class HikesController < ApplicationController
    def index
      @hikes = Hike.all
    end

    def count
      @count = Hike.count
      render json: { count: @count }
    end
end