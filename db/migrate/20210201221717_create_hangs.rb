class CreateHangs < ActiveRecord::Migration[6.1]
  def change
    create_table :hangs do |t|
      t.string :type
      t.integer :duration #should be in seconds
      t.integer :user_id #belongs to user
      
      t.datetime :time #time when exercise was done
    end
  end
end
