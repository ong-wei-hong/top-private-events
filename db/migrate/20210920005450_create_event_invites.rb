class CreateEventInvites < ActiveRecord::Migration[6.1]
  def change
    create_table :event_invites do |t|
      t.belongs_to :invited_event, foreign_key: { to_table: 'events' }
      t.belongs_to :invitee, foreign_key: { to_table: 'users' }

      t.timestamps
    end
  end
  add_column :events, :open_to_all, :boolean
end
