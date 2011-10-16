class CreateUpvotes < ActiveRecord::Migration
  def change
    create_table :upvotes do |t|
      t.integer :user_id
      t.integer :pitch_id
      t.text :comment

      t.timestamps
    end
  end
end
