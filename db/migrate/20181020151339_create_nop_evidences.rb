class CreateNopEvidences < ActiveRecord::Migration[5.2]
  def change
    create_table :nop_evidences do |t|
      t.references :claim, foreign_key: true
      t.references :source, foreign_key: true

      t.timestamps
    end
  end
end
