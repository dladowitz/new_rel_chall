class EventsController < ApplicationController
  def create
    org = Org.find params[:org_id]
    @event = org.events.build event_params

    #TODO move to seperate method
      #TODO need a way to look up the calling hostname and save into event.
      #Can probably pull this out of the request object.
      #For the moment I'm just going to use the remote IP.
      @event.hostname = request.remote_ip

    respond_to do |format|
      if @event.save
        format.json { "Hi five! Your Event Created Was Created!"}
      else
        format.json { "Something has gone horribly wrong!"}
      end
    end
  end

  def index
    org = Org.find params[:org_id]
    @events = find_events(params, org)

    # binding.pry
    respond_to do |format|
      if org
        format.json { @events }
        format.html { @events } #just using this for easy visualization. Will remove
      else
        format.json { "Doh! Can't find that Org."}
      end
    end
  end

  private

  def event_params
    params.require(:event).permit(:string)
  end

  def find_events(params, org)
    events = org.events.last( || 10)
    events = events.reverse if params[:reverse]
    events = events.where(hostname: hostname) if params[:hostname]

    return events
  end
end
