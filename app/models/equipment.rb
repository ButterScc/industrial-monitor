class Equipment < ApplicationRecord
  has_many :sensors, dependent: :destroy
  
  validates :name, presence: true
  validates :code, presence: true, uniqueness: true
end
