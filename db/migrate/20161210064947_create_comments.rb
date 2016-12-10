class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.references :circle, foreign_key: true
      t.string :name
      t.string :message

      t.timestamps
    end
  end
end
