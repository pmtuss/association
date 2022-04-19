class CreateBankInfos < ActiveRecord::Migration[7.0]
  def change
    create_table :bank_infos do |t|
      t.string :name
      t.references :card, null: false, foreign_key: true

      t.timestamps
    end
  end
end
