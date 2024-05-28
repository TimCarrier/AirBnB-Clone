class RemoveUserReferenceFromDogs < ActiveRecord::Migration[7.1]
  def change
    remove_reference :dogs, :user, null: false, foreign_key: true
  end
end
