class AddChannelToProgram < ActiveRecord::Migration[6.0]
  def change
    add_reference :programs, :channel, null: false, foreign_key: true
  end
end
