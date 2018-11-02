class CreateClaims < ActiveRecord::Migration[5.2]
  def change
    create_table :claims do |t|
      t.string :title
      t.string :body
      t.references :person, foreign_key: true
      t.datetime :claimed_at
      t.datetime :happened_at

      t.timestamps
    end
  end
end
