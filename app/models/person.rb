class Person < ActiveRecord::Base
  has_many :addresses

  validates :name, presence: true
end
