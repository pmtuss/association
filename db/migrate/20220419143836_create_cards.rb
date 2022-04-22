class CreateCards < ActiveRecord::Migration[7.0]
  def change
    create_table :cards do |t|
      t.string :card_type
      t.string :number
      t.datetime :expire
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
