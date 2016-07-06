class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :string
      t.string :hostname
      t.references :org, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
