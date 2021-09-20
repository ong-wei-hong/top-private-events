class EventAttendancesController < ApplicationController
  def create
    event_attendance = EventAttendance.new(attended_event_id: params[:event_id], attendee_id: current_user.id )
    if event_attendance.save
      flash.notice = 'You have signed up to attend this event'
    else
      flash.alert = 'Error please try again'
    end
    redirect_to event_path(params[:event_id])
  end

  def destroy
    EventAttendance.where("attended_event_id = :event AND attendee_id = :user", { event: params[:event_id], user: current_user.id }).destroy_all
    flash.notice = 'You have unattended this event'
    redirect_to event_path(params[:event_id])
  end
end
