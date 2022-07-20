class ChangeTableUsers < ActiveRecord::Migration[6.1]
  def change
    change_table :users do |t|
      t.rename :type_user, :group
    end
  end
end
