class CreateMatches < ActiveRecord::Migration[7.1]
  def change
    create_table :matches do |t|
      t.integer :user_id
      t.integer :matched_user_id
      t.string :status

      t.timestamps
    end
  end
end
