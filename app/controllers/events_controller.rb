class EventsController < ApplicationController
  def index
    @events = Event
  end

  def new
    @event = current_user.events.build
  end

  def create
    @event = current_user.events.build(event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to root_path, notice: "Event was successfully created." }
        format.json { render :index, status: :created, location: @event }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    Event.find(params[:id]).destroy
    flash.notice = 'Event was successfully destroyed'
    redirect_to user_path(current_user.id)
  end

  def show
    @event = Event.find(params[:id])
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(event_params)
      flash.notice = 'Event was successfully updated'
    else
      flash.notice = 'Error please try again'
    end
    redirect_to @event
  end

  private

  def event_params
    params.require(:event).permit(:title, :date, :open_to_all)
  end
end
