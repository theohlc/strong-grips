class CreateHangs < ActiveRecord::Migration[6.1]
  def up
    create_table :hangs do |t|
      t.string :type
      t.integer :duration #should be in seconds
      t.integer :user_id #belongs to user
      
      t.datetime :time #time when exercise was done
    end
  end

  def down
    drop_table :hangs
  end
end