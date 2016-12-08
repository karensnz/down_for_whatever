class ChoicesController < ApplicationController
  def index
    @choices = Choice.page(params[:page]).per(10)
    @location_hash = Gmaps4rails.build_markers(@choices.where.not(:state_latitude => nil)) do |choice, marker|
      marker.lat choice.state_latitude
      marker.lng choice.state_longitude
      marker.infowindow "<h5><a href='/choices/#{choice.id}'>#{choice.created_at}</a></h5><small>#{choice.state_formatted_address}</small>"
    end
    @location_hash = Gmaps4rails.build_markers(@choices.where.not(:city_latitude => nil)) do |choice, marker|
      marker.lat choice.city_latitude
      marker.lng choice.city_longitude
      marker.infowindow "<h5><a href='/choices/#{choice.id}'>#{choice.created_at}</a></h5><small>#{choice.city_formatted_address}</small>"
    end
    @location_hash = Gmaps4rails.build_markers(@choices.where.not(:address_latitude => nil)) do |choice, marker|
      marker.lat choice.address_latitude
      marker.lng choice.address_longitude
      marker.infowindow "<h5><a href='/choices/#{choice.id}'>#{choice.created_at}</a></h5><small>#{choice.address_formatted_address}</small>"
    end

    render("choices/index.html.erb")
  end

  def show
    @vote = Vote.new
    @choice = Choice.find(params[:id])

    render("choices/show.html.erb")
  end

  def new
    @choice = Choice.new

    render("choices/new.html.erb")
  end

  def create
    @choice = Choice.new

    @choice.event_id = params[:event_id]
    @choice.location = params[:location]
    @choice.address = params[:address]
    @choice.city = params[:city]
    @choice.state = params[:state]

    save_status = @choice.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/choices/new", "/create_choice"
        redirect_to("/choices")
      else
        redirect_back(:fallback_location => "/", :notice => "Choice created successfully.")
      end
    else
      render("choices/new.html.erb")
    end
  end

  def edit
    @choice = Choice.find(params[:id])

    render("choices/edit.html.erb")
  end

  def update
    @choice = Choice.find(params[:id])

    @choice.event_id = params[:event_id]
    @choice.location = params[:location]
    @choice.address = params[:address]
    @choice.city = params[:city]
    @choice.state = params[:state]

    save_status = @choice.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/choices/#{@choice.id}/edit", "/update_choice"
        redirect_to("/choices/#{@choice.id}", :notice => "Choice updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Choice updated successfully.")
      end
    else
      render("choices/edit.html.erb")
    end
  end

  def destroy
    @choice = Choice.find(params[:id])

    @choice.destroy

    if URI(request.referer).path == "/choices/#{@choice.id}"
      redirect_to("/", :notice => "Choice deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Choice deleted.")
    end
  end
end
