class RentalsController < ApplicationController
  before_action :current_user_must_be_rental_sublettor, :only => [:edit, :update, :destroy]

  def current_user_must_be_rental_sublettor
    rental = Rental.find(params[:id])

    unless current_user == rental.sublettor
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @rentals = Rental.all

    render("rentals/index.html.erb")
  end

  def show
    @rental = Rental.find(params[:id])

    render("rentals/show.html.erb")
  end

  def new
    @rental = Rental.new

    render("rentals/new.html.erb")
  end

  def create
    @rental = Rental.new

    @rental.name = params[:name]
    @rental.address = params[:address]
    @rental.image = params[:image]
    @rental.description = params[:description]
    @rental.feature = params[:feature]
    @rental.rent_amount = params[:rent_amount]
    @rental.date_available = params[:date_available]
    @rental.end_date = params[:end_date]
    @rental.user_id = params[:user_id]
    @rental.roommates = params[:roommates]

    save_status = @rental.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/rentals/new", "/create_rental"
        redirect_to("/rentals")
      else
        redirect_back(:fallback_location => "/", :notice => "Rental created successfully.")
      end
    else
      render("rentals/new.html.erb")
    end
  end

  def edit
    @rental = Rental.find(params[:id])

    render("rentals/edit.html.erb")
  end

  def update
    @rental = Rental.find(params[:id])

    @rental.name = params[:name]
    @rental.address = params[:address]
    @rental.image = params[:image]
    @rental.description = params[:description]
    @rental.feature = params[:feature]
    @rental.rent_amount = params[:rent_amount]
    @rental.date_available = params[:date_available]
    @rental.end_date = params[:end_date]
    @rental.user_id = params[:user_id]
    @rental.roommates = params[:roommates]

    save_status = @rental.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/rentals/#{@rental.id}/edit", "/update_rental"
        redirect_to("/rentals/#{@rental.id}", :notice => "Rental updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Rental updated successfully.")
      end
    else
      render("rentals/edit.html.erb")
    end
  end

  def destroy
    @rental = Rental.find(params[:id])

    @rental.destroy

    if URI(request.referer).path == "/rentals/#{@rental.id}"
      redirect_to("/", :notice => "Rental deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Rental deleted.")
    end
  end
end
