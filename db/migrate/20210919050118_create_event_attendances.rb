class CreateEventAttendances < ActiveRecord::Migration[6.1]
  def change
    create_table :event_attendances do |t|
      t.belongs_to :attended_event, foreign_key: { to_table: 'events' }
      t.belongs_to :attendee, foreign_key: { to_table: 'users' }

      t.timestamps
    end
  end
end
