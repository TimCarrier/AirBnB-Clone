class CreateDogs < ActiveRecord::Migration[7.1]
  def change
    create_table :dogs do |t|
      t.string :name
      t.integer :age
      t.date :disponibility
      t.string :race
      t.string :description
      t.string :address
      t.integer :rating

      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
