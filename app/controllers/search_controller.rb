class SearchController < ApplicationController
  def index
    @search_terms = params[:q]

    pokeSearch = Pokemon.arel_table
    @pokemons = Pokemon.where(pokeSearch[:name].matches("%" + @search_terms + "%"))
  end
end
