class CreateMatches < ActiveRecord::Migration[7.1]
  def change
    create_table :matches do |t|
      t.references :user, null: false, foreign_key: { to_table: :users }
      t.references :matched_user, null: false, foreign_key: { to_table: :users }
      t.string :status, default: 'pending'

      t.timestamps
    end

    add_index :matches, [:user_id, :matched_user_id], unique: true
  end
end
