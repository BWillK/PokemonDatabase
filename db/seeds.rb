# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
@url = 'https://pokeapi.co/api/v2/pokemon/'
if Pokemon.count == 0
  NEXT_POKEMON = 1
else
  NEXT_POKEMON = Pokemon.last.id + 1
end
TOTAL_POKEMON = HTTParty.get(@url).parsed_response['count']

(0..165).each do |x|
  puts "Creating Pokemon #{x}"
  @pokemon = HTTParty.get(@url + x.to_s).parsed_response

  # Populate abilities tables here
  @pokemon['abilities'].each do |thisAbility|
    @abilityUrl = thisAbility['ability']['url']
    @ability = HTTParty.get(@abilityUrl).parsed_response
    Ability.where(name: @ability['name']).first_or_create do |new_ability|
      new_ability.generation = @ability['generation']['name']
      new_ability.ability_id = @ability['id']
    end
    # Create reference on join table
    PokemonAbility.create(pokemon: @pokemon, ability: @ability)
  end

  # Populate Types table here
  @pokemon['types'].each do |thisType|
    @typeUrl = thisType['type']['url']
    @type = HTTParty.get(@typeUrl).parsed_response
    Type.where(name: @type['name']).first_or_create do |new_type|
      new_type.type_id = @type['id']
      new_type.generation = @type['generation']['name']
    end
  #   Create reference on join table
  PokemonType.create(pokemon: @pokemon, ability: @ability)
  end

  new_pokeman = Pokemon.create(name: @pokemon['name'], height: @pokemon['height'], weight: @pokemon['weight'], pokemon_id: @pokemon['id'], order: @pokemon['order'], id: x)
  new_pokeman.save
end

