class AddTimingToTests < ActiveRecord::Migration[6.1]
  def change
    add_column :tests, :timing, :integer
  end
end
