class CreateCircles < ActiveRecord::Migration[5.0]
  def change
    create_table :circles do |t|
      t.string :name
      t.string :twitter_id
      t.text :goal
      t.integer :join
      t.string :image
      t.string :detail

      t.timestamps
    end
  end
end
