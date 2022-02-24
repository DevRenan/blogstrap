class Category < ApplicationRecord
  validates :name, 
            presence: true,
            length: {minimum: 3},
            uniqueness: {case_sensitive: false}

  has_many :articles, dependent: :restrict_with_error

  scope :sorted, -> {order(:name)}
end
