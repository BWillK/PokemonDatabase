class SearchController < ApplicationController
  def index
    @search_terms = params[:q]
    @search_category = params[:p]

    pokeSearch = @search_category.to_ruby.arel_table
    @searchResults = @search_category.to_ruby.where(pokeSearch[:name].matches("%" + @search_terms + "%"))
  end
end
