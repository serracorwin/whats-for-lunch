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

  def self.todays_pick
    if count == 1
      return first
    end

    joins(:ratings).where.not(last_visit: Date.yesterday)
      .select('"restaurants".*, AVG("ratings"."value") AS avg_rating')
      .order('avg_rating, last_visit DESC').group(:id).last
  end
end
