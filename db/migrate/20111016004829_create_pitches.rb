class CreatePitches < ActiveRecord::Migration
  def change
    create_table :pitches do |t|
      t.string :name
      t.text :details
      t.string :youtube_link
      t.integer :tech_need
      t.integer :biz_need
      t.boolean :public_visible

      t.timestamps
    end
  end
end
