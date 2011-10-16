class AddUserIdToPitches < ActiveRecord::Migration
  def change
    add_column :pitches, :user_id, :integer
  end
end
