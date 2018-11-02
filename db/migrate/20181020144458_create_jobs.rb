class CreateJobs < ActiveRecord::Migration[5.2]
  def change
    create_table :jobs do |t|
      t.references :person
      t.string :name
      t.datetime :started_at
      t.datetime :ended_at

      t.timestamps
    end
  end
end
