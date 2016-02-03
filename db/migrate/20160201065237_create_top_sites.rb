class CreateTopSites < ActiveRecord::Migration
  def change
    create_table :top_sites do |t|
      t.string :name
      t.string :url
      t.integer :rank
      t.integer :ordering

      t.timestamps null: false
    end
  end
end
