puts 'Cleaning database...'
Restaurant.destroy_all

puts 'Creating restaurants...'
restaurants_attributes = [
  {
    name:         "Epicure au Bristol",
    address:      "112 rue du Fg St-Honoré 75008 Paris",
    description:  "Face au jardin, on découvre une salle lumineuse... et la cuisine d'Éric Frechon.",
    stars:        3
  },
  {
    name:         "La truffière",
    address:      "4 rue Blainville 75005 Paris",
    description:  "Une valeur sûre que cette belle maison du 17e et les recettes de Jean-Christophe Rizet",
    stars:        1
  },
  {
    name:         "Le pré catelan",
    address:      "route de Suresnes 75016 Paris",
    description:  "Oeil vif, geste sûr: impossible de distinguer, dans les créations de Frédéric Anton...",
    stars:        3
  }
]
Restaurant.create!(restaurants_attributes)
puts 'Finished!'
rails db:seed
BEYOND CRUD

You are not limited to the seven routes that RESTful routing creates by default.
Say you want a route to list three stars restaurants. Something like:
GET /restaurants/top
NESTED RESOURCES

Now we want routes to add a review on a restaurant
GET /restaurants/42/reviews/new
POST /restaurants/42/reviews
NAMESPACED ROUTING

VALIDATION

# app/models/restaurant.rb
class Restaurant < ApplicationRecord
  validates :stars, inclusion: { in: [1, 2, 3], allow_nil: false }
  validates :name, uniqueness: true, presence: true
  validates :address, presence: true
end
# app/controllers/restaurants_controller.rb
class RestaurantsController < ApplicationController
  def create
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.save
    # Unless @restaurant.valid?, #save will return false,
    # and @restaurant is not persisted.
    # TODO: present the form again with error messages.
    redirect_to restaurant_path(@restaurant)
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address)
  end
end
# app/controllers/restaurants_controller.rb
class RestaurantsController < ApplicationController
  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address)
  end
end
