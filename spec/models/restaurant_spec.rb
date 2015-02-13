require 'rails_helper'

describe Restaurant do
  describe "#available?" do
    let(:restaurant) { Restaurant.create(:name => "Canoe", :capacity => 100) }

    it "should return true if party size is less than capacity" do
      expect(restaurant.available?(10, Time.new(2015, 2, 14, 18))).to eq(true)
    end

    it "should return false if party size is bigger than capacity" do
      expect(restaurant.available?(200, Time.new(2015, 2, 14, 18))).to eq(false)
    end

    context "with one reservation" do
      let!(:reservation) { Reservation.create(:restaurant => restaurant, :party_size => 50) }

      it "should return true if the restaurant isn't full" do
        expect(restaurant.available?(10, Time.new(2015, 2, 14, 18))).to eq(true)
      end

      it "should return false if the restaurant is full" do
        expect(restaurant.available?(99, Time.new(2015, 2, 14, 18))).to eq(false)
      end
    end
  end
end
