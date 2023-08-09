class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.date :event_date
      t.time :event_time
      t.string :title
      t.text :description
      

      t.timestamps
    end
  end
end
