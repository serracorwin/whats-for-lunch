class HomeController < ApplicationController
  def index
    @restaurant = Restaurant.todays_pick
    @restaurant.update(last_visit: Date.today) unless @restaurant.nil?
  end
end
