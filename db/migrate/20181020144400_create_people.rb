class CreatePeople < ActiveRecord::Migration[5.2]
  def change
    create_table :people do |t|
      t.string :name
      t.datetime :born_at
      t.datetime :dead_at

      t.timestamps
    end
  end
end
