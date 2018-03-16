Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root :to => "rentals#index"
  # Routes for the Saved_rental resource:
  # CREATE
  get "/saved_rentals/new", :controller => "saved_rentals", :action => "new"
  post "/create_saved_rental", :controller => "saved_rentals", :action => "create"

  # READ
  get "/saved_rentals", :controller => "saved_rentals", :action => "index"
  get "/saved_rentals/:id", :controller => "saved_rentals", :action => "show"

  # UPDATE
  get "/saved_rentals/:id/edit", :controller => "saved_rentals", :action => "edit"
  post "/update_saved_rental/:id", :controller => "saved_rentals", :action => "update"

  # DELETE
  get "/delete_saved_rental/:id", :controller => "saved_rentals", :action => "destroy"
  #------------------------------

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
