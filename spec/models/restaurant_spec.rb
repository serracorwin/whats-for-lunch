require "rails_helper"

RSpec.describe Restaurant do
  let!(:restaurant) { create(:restaurant) }

  describe ".todays_pick" do
    context "only one restaurant in database" do
      it "always returns the one restaurant" do
        expect(Restaurant.todays_pick).to eq(restaurant)
      end
    end

    context "with multiple restaurants" do
      let(:user) { create(:user) }
      let!(:yesterday) { create(:restaurant, last_visit: Date.yesterday) }
      let!(:week_ago) { create(:restaurant, last_visit: Date.today - 1.week) }
      let!(:month_ago) { create(:restaurant, last_visit: Date.today - 1.month) }

      before do
        month_ago.ratings.create(user: user, value: 1)
      end

      it "prioritizes the oldest visit" do
        expect(Restaurant.todays_pick).to eq(month_ago)
      end

      context "with ratings in mind" do
        let!(:month_ago_high) { create(:restaurant, last_visit: Date.today - 1.month) }

        before do
          2.times do |i|
            month_ago.ratings.create(user: user, value: i + 1)
            month_ago_high.ratings.create(user: user, value: i + 3)
          end
        end

        it "prioritizes high ratings" do
          expect(Restaurant.todays_pick).to eq(month_ago_high)
        end
      end
    end
  end
end