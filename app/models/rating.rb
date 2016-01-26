# == Schema Information
#
# Table name: ratings
#
#  created_at    :datetime         not null
#  id            :integer          not null, primary key
#  restaurant_id :integer
#  updated_at    :datetime         not null
#  user_id       :integer
#  value         :integer
#
# Indexes
#
#  index_ratings_on_restaurant_id  (restaurant_id)
#  index_ratings_on_user_id        (user_id)
#
# Foreign Keys
#
#  fk_rails_a7dfeb9f5f  (user_id => users.id)
#  fk_rails_d1b37b4fd3  (restaurant_id => restaurants.id)
#

class Rating < ActiveRecord::Base
  belongs_to :restaurant, required: true
  belongs_to :user, required: true

  validates :value, numericality: { greater_than: 0, less_than: 6, only_integer: true }
end
