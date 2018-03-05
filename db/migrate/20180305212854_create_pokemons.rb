class CreatePokemons < ActiveRecord::Migration[5.1]
  def change
    create_table :pokemons do |t|
      t.string :name
      t.decimal :height
      t.integer :weight
      t.integer :pokemon_id
      t.string :order

      t.timestamps
    end
  end
end
