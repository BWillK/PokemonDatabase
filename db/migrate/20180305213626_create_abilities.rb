class CreateAbilities < ActiveRecord::Migration[5.1]
  def change
    create_table :abilities do |t|
      t.string :name
      t.string :generation
      t.integer :ability_id

      t.timestamps
    end
  end
end
