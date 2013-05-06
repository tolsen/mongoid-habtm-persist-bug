class User
  include Mongoid::Document

  has_and_belongs_to_many :cars, inverse_of: :users

  belongs_to :favorite_car, class_name: 'Car', inverse_of: :person

  before_validation :set_default_favorite_car, on: :create
  before_save :update_cars

  def set_default_favorite_car
    unless self.favorite_car
      self.favorite_car = Car.create!
    end
  end
  
  def updated_cars
    [favorite_car].compact
  end

  def update_cars
    _updated_cars = updated_cars
    self.cars = _updated_cars unless self.cars.map(&:id).sort == _updated_cars.map(&:id).sort
    true
  end
  
end
