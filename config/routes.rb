Rails.application.routes.draw do
  # Routes for the Rental resource:
  # CREATE
  get "/rentals/new", :controller => "rentals", :action => "new"
  post "/create_rental", :controller => "rentals", :action => "create"

  # READ
  get "/rentals", :controller => "rentals", :action => "index"
  get "/rentals/:id", :controller => "rentals", :action => "show"

  # UPDATE
  get "/rentals/:id/edit", :controller => "rentals", :action => "edit"
  post "/update_rental/:id", :controller => "rentals", :action => "update"

  # DELETE
  get "/delete_rental/:id", :controller => "rentals", :action => "destroy"
  #------------------------------

  devise_for :users
  # Routes for the User resource:
  # READ
  get "/users", :controller => "users", :action => "index"
  get "/users/:id", :controller => "users", :action => "show"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
