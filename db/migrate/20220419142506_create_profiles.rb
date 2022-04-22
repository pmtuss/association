class CreateProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :profiles do |t|
      t.string :name
      t.string :nickname
      t.string :telephone
      t.string :address
      t.datetime :dob
      t.references :user, null: true, foreign_key: true

      t.timestamps
    end
  end
end
