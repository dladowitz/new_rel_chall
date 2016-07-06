class EventsController < ApplicationController
  def create
    org = Org.find params[:org_id]
    @event = org.events.build event_params

    #also need a way to look up the calling hostname and save into event. Can pull this out of the request object.

    respond_to do |format|
      if @event.save
        format.json { "Hi five! Your Event Created Was Created!"}
      else
        format.json { "Something has gone horribly wrong!"}
      end
    end
  end

  def index
    # binding.pry
    org = Org.find params[:org_id]
    @events = org.events.last(10) #defaulting to 10 events for now

    #I'd create scopes for each of these on the model
    #Need query param for number of events
    #Need query param for reversing chronological
    #Need query param for limiting to hostname

    respond_to do |format|
      if org
        format.json { @events }
        format.html { @events }#just using this for easy visualization. Will remove
      else
        format.json { "Doh! Can't find that Org."}
        format.html { "Doh! Can't find that Org."}
      end
    end
  end

  private

  def event_params
    params.require(:event).permit(:string)
  end
end
