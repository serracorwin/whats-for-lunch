# == Schema Information
#
# Table name: restaurants
#
#  created_at :datetime         not null
#  id         :integer          not null, primary key
#  last_visit :date
#  name       :string
#  updated_at :datetime         not null
#

class Restaurant < ActiveRecord::Base
  has_many :ratings, dependent: :destroy
end
