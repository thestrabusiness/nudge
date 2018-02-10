class CreateNudge < ActiveRecord::Migration[5.1]
  enable_extension 'pgcrypto'

  def change
    create_table :nudges, id: :uuid do |t|
      t.string :body, null: false
      t.string :title, null: false

      t.timestamps null: false
    end
  end
end
