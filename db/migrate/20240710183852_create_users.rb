class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :location
      t.integer :handicap
      t.integer :gir
      t.integer :fairways_hit
      t.integer :putts_per_round
      t.string :password_digest
      t.string :image_url

      t.timestamps
    end
  end
end
