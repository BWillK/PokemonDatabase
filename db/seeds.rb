# Record creation code for my database
#
# Clear the records first...
PokemonType.delete_all
PokemonAbility.delete_all
Pokemon.delete_all
Type.delete_all
Ability.delete_all


@url = 'https://pokeapi.co/api/v2/pokemon/'
if Pokemon.count == 0
  NEXT_POKEMON = 1
else
  NEXT_POKEMON = Pokemon.last.id + 1
end
TOTAL_POKEMON = HTTParty.get(@url).parsed_response['count']

(1..165).each do |x|
  puts "Creating Pokemon #{x}"
  @pokemon = HTTParty.get(@url + x.to_s).parsed_response

  # Create th pokemon!
  new_pokeman = Pokemon.create(name: @pokemon['name'], height: @pokemon['height'], weight: @pokemon['weight'], pokemon_id: @pokemon['id'], order: @pokemon['order'], id: x)
  new_pokeman.save

  # Populate abilities tables here
  @pokemon['abilities'].each do |thisAbility|
    @abilityUrl = thisAbility['ability']['url']
    @ability = HTTParty.get(@abilityUrl).parsed_response
    puts 'Creating ability: ' + @ability['name']
    fresh_ability = Ability.where(name: @ability['name']).first_or_create do |new_ability|
      new_ability.generation = @ability['generation']['name']
      new_ability.ability_id = @ability['id']
    end
    # Create reference on join table
    PokemonAbility.create(pokemon: new_pokeman, ability: fresh_ability)
  end

  # Populate Types table here
  @pokemon['types'].each do |thisType|
    @typeUrl = thisType['type']['url']
    @type = HTTParty.get(@typeUrl).parsed_response
    puts 'Creating type: ' + @type['name']
    fresh_type = Type.where(name: @type['name']).first_or_create do |new_type|
      new_type.type_id = @type['id']
      new_type.generation = @type['generation']['name']
    end
  #   Create reference on join table
  PokemonType.create(pokemon: new_pokeman, type: fresh_type)
  end

end

