class WelcomeController < ApplicationController
  def index
    @pokemons = Pokemon.all
    @abilities = Ability.all
    @types = Type.all
  end

  def about
    @test = 'test'
  end
end
