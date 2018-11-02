class CreateSources < ActiveRecord::Migration[5.2]
  def change
    create_table :sources do |t|
      t.string :title
      t.string :body
      t.references :person, foreign_key: true
      t.datetime :released_at

      t.timestamps
    end
  end
end
