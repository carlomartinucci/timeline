class CreateInvolvements < ActiveRecord::Migration[5.2]
  def change
    create_table :involvements do |t|
      t.references :person, foreign_key: true
      t.references :claim, foreign_key: true

      t.timestamps
    end
  end
end
