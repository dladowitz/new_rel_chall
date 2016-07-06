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
    # binding.pry
    org = Org.find params[:org_id]

    #TODO move this into another method as it doens't all belong in the index controller
      #TODO create scopes for each of these on the model
      number = event_params[:number] || 10 #defaulting to 10 events
      reverse = event_params[:reverse] || nil
      hostname = event_params[:hostname] || nil

      @events = org.events.last(number)
      @events = @events.reverse if reverse
      @evetnts = @events.where(hostname: hostname) if hostname


    respond_to do |format|
      if org
        format.json { @events }
        format.html { @events } #just using this for easy visualization. Will remove
      else
        format.json { "Doh! Can't find that Org."}
        format.html { "Doh! Can't find that Org."}
      end
    end
  end

  private

  def event_params
    params.require(:event).permit(:string, :reverse, :hostname, :number)
  end
end
