class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :image, index: true, foreign_key: true, null: false
      t.text :body, null: false

      t.timestamps null: false
    end
  end
end
