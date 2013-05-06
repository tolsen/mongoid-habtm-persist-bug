class Car
  include Mongoid::Document

  has_and_belongs_to_many :users, inverse_of: :cars
  has_one :person, class_name: 'User', inverse_of: :favorite_car

end
