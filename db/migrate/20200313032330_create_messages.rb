class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.string :message
      t.integer :sender_id, index: true, foreign_key: true
      t.integer :receiver_id, index: true, foreign_key: true

      t.timestamps
    end
  end
end
