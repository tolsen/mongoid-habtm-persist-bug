require 'spec_helper'

describe User do

  before do
    @user = User.create!
  end

  describe "updating favorite_car" do

    before do
      @car = Car.create!
      @user.favorite_car = @car
      @user.save!
    end

    it "should update cars" do
      @user.cars.should eq([@car])
    end

    it "should update car_ids" do
      @user.car_ids.should eq([@car.id])
    end

    it "should persist new cars" do
      @user.reload.cars.should eq([@car])
    end

  end
end
