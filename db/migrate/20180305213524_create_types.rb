class CreateTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :types do |t|
      t.string :name
      t.integer :type_id
      t.string :generation

      t.timestamps
    end
  end
end
