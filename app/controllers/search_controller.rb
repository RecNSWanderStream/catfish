class SearchController < ApplicationController
  def index
  end

  #inital method to querey db by activity type
  def result
    @results = Asset.search_by_activity_type(params[:q].downcase)
  end
end
