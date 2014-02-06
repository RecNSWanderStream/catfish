class SearchController < ApplicationController
  def index
  end

  def result
    @results = Asset.all
  end
end
