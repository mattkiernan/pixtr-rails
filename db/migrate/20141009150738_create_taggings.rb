class CreateTaggings < ActiveRecord::Migration
  def change
    create_table :taggings do |t|
      t.integer :tag_id
      t.integer :image_id

      t.timestamps
    end
    add_index :taggings, [:image_id, :tag_id], unique: true
  end
end
