class CreatePicts < ActiveRecord::Migration[5.0]
  def change
    create_table :picts do |t|
      t.string :name
      t.string :text
      t.text :image1
      t.text :image2
      t.text :image3
      t.text :image4
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
