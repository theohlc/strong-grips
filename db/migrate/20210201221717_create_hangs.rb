class CreateHangs < ActiveRecord::Migration[6.1]
  def up
    create_table :hangs do |t|
      t.string :type
      t.integer :time #should be in seconds
      t.integer :user_id
    end
  end

  def down
    drop_table :hangs
  end
end
