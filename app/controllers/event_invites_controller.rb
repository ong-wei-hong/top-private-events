class EventInvitesController < ApplicationController
  def new
    @invited_users = []
    @other_users = []
    User.all.find_each do |user|
      if user.invited_events.include?(Event.find(params[:event_id]))
        @invited_users.push(user)
      else
        @other_users.push(user)
      end
    end
  end

  def create
    event_invite = EventInvite.new(event_invite_params)
    if event_invite.save
      flash.notice = 'Event invite saved'
    else
      flash.alert = 'Error please try again'
    end
    redirect_to controller: 'event_invites', action: 'new', event_id: params[:invited_event_id]
  end

  private

  def event_invite_params
    params.permit(:invited_event_id, :invitee_id)
  end
end
