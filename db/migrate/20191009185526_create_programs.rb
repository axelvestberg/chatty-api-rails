class CreatePrograms < ActiveRecord::Migration[6.0]
  def change
    create_table :programs do |t|
      t.string :title
      t.datetime :start
      t.datetime :stop
      t.boolean :live

      t.timestamps
    end
  end
end
