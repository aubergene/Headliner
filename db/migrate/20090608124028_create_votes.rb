class CreateVotes < ActiveRecord::Migration
  def self.up
    create_table :votes do |t|
      t.integer :article_id
      t.integer :source_id

      t.timestamps
    end
  end

  def self.down
    drop_table :votes
  end
end
