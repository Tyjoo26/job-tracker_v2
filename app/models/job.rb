class Job < ApplicationRecord
  validates :title, :level_of_interest, :city, presence: true
  belongs_to :company
  belongs_to :category
  has_many :comments, dependent: :destroy


  def self.count_by_level_of_interest
    count(:level_of_interest)
  end
end
