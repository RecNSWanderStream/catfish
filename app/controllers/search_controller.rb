class SearchController < ApplicationController
  def index
  end

  # GET /regions.json
  def regions
    @regions = Region.all
  end

  #inital method to querey db by activity type
  def result
    @results = Asset.search(params[:q])
  end
end
