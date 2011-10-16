class YoutubeVideo < ActiveRecord::Migration
  def up
		create_table :ytvideos do |t|
			t.primary_key :id
			t.string :date
			t.text :title
			t.text :embed_url
			t.integer :length
		end
  end

  def down
	 drop_table :ytvideos
  end
end
