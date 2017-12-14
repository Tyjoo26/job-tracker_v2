class Job < ApplicationRecord
  validates :title, :level_of_interest, :city, presence: true
  belongs_to :company
  belongs_to :category
  has_many :comments, dependent: :destroy




  def self.count_by_level_of_interest
    group(:level_of_interest).order('level_of_interest DESC').count
  end

  def self.count_jobs_location
    group(:city).order("city DESC").count
  end



end
