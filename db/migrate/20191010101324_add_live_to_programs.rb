class AddLiveToPrograms < ActiveRecord::Migration[6.0]
  def change
    change_column :programs, :live, :boolean, :default => false
  end
end
