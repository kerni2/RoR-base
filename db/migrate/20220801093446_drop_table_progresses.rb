class DropTableProgresses < ActiveRecord::Migration[6.1]
  def up
    drop_table :progresses, if_exists: true
  end

  def down
  end
end
