class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.string :city
      t.string :state
      t.string :street
      t.string :zip
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
