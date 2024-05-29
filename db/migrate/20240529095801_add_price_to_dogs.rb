class AddPriceToDogs < ActiveRecord::Migration[7.1]
  def change
    add_column :dogs, :price, :float
  end
end
