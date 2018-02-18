class CreateTimeWindow < ActiveRecord::Migration[5.1]
  def change
    create_table :time_windows, id: :uuid do |t|
      t.string :name, null: false
      t.time :start_time, null: false
      t.time :end_time, null: false

      t.timestamps null: false
    end

    add_reference :nudges, :time_window, type: :uuid, index: true, foreign_key: true
  end
end
