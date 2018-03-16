class SavedRentalsController < ApplicationController
  before_action :current_user_must_be_saved_rental_user, :only => [:edit, :update, :destroy]

  def current_user_must_be_saved_rental_user
    saved_rental = SavedRental.find(params[:id])

    unless current_user == saved_rental.user
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @q = current_user.saved_rentals.ransack(params[:q])
      @saved_rentals = @q.result(:distinct => true).includes(:user, :rental).page(params[:page]).per(10)

    render("saved_rentals/index.html.erb")
  end

  def show
    @saved_rental = SavedRental.find(params[:id])

    render("saved_rentals/show.html.erb")
  end

  def new
    @saved_rental = SavedRental.new

    render("saved_rentals/new.html.erb")
  end

  def create
    @saved_rental = SavedRental.new

    @saved_rental.rental_id = params[:rental_id]
    @saved_rental.user_id = params[:user_id]
    @saved_rental.notes = params[:notes]

    save_status = @saved_rental.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/saved_rentals/new", "/create_saved_rental"
        redirect_to("/saved_rentals")
      else
        redirect_back(:fallback_location => "/", :notice => "Saved rental created successfully.")
      end
    else
      render("saved_rentals/new.html.erb")
    end
  end

  def edit
    @saved_rental = SavedRental.find(params[:id])

    render("saved_rentals/edit.html.erb")
  end

  def update
    @saved_rental = SavedRental.find(params[:id])

    @saved_rental.rental_id = params[:rental_id]
    @saved_rental.user_id = params[:user_id]
    @saved_rental.notes = params[:notes]

    save_status = @saved_rental.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/saved_rentals/#{@saved_rental.id}/edit", "/update_saved_rental"
        redirect_to("/saved_rentals/#{@saved_rental.id}", :notice => "Saved rental updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Saved rental updated successfully.")
      end
    else
      render("saved_rentals/edit.html.erb")
    end
  end

  def destroy
    @saved_rental = SavedRental.find(params[:id])

    @saved_rental.destroy

    if URI(request.referer).path == "/saved_rentals/#{@saved_rental.id}"
      redirect_to("/", :notice => "Saved rental deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Saved rental deleted.")
    end
  end
end
