
class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.string :location
      t.datetime :date
      t.references :user, foreign_key: true

      t.timestamps null: false
    end
  end
end
