class Tester
  require 'httparty'
  puts 'STUFF'
  @url = 'https://pokeapi.co/api/v2/pokemon/1'
  @pokemon = HTTParty.get(@url).parsed_response

  @pokemon['abilities'].each do |thisAbility|
    puts thisAbility['ability']['url']
    @abilityUrl = thisAbility['ability']['url']
    @ability = HTTParty.get(@abilityUrl).parsed_response
    puts @ability['name']
    puts @ability['generation']['name']
    puts @ability['id']
    Ability.where(name: @ability['name']).first_or_create do |new_ability|
      new_ability.generation = @ability['generation']['name']
      new_ability.ability_id = @ability['id']
    end
    puts Ability.first
  end
end

@pokemon['abilities'].each do |thisAbility|
  @abilityUrl = thisAbility['ability']['url']
  @ability = HTTParty.get(@abilityUrl).parsed_response
  Ability.where(name: @ability['name']).first_or_create do |new_ability|
      new_ability.generation = @ability['generation']['name']
      new_ability.ability_id = @ability['id']
  end
end