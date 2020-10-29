class CreateCities < ActiveRecord::Migration[6.0]
  def change
    create_table :cities do |t|
      t.string :name, null: false
      t.float :latitude
      t.float :longitude
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end

    add_index :cities, :name
  end
end
