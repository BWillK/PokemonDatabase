class CreatePokemonAbilities < ActiveRecord::Migration[5.1]
  def change
    create_table :pokemon_abilities do |t|
      t.references :pokemon, foreign_key: true
      t.references :ability, foreign_key: true

      t.timestamps
    end
  end
end
