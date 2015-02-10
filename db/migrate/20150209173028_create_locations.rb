class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :name
      t.string :address
      t.integer :zipcode
      # t.belongs_to :users, index: true
    end
  end
end
