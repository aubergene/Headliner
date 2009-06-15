class CreateArticles < ActiveRecord::Migration
  def self.up
    create_table :articles do |t|
      t.integer :source_id

      t.string :guid
      t.string :title
      t.string :link
      t.datetime :pub_date

      t.timestamps
    end
    add_index :articles, :guid, :unique => true
  end

  def self.down
    drop_table :articles
  end
end
