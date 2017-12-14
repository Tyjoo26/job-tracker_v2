class Company < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :jobs, dependent: :destroy
  has_many :contacts

  def self.top_three
    companies = select('companies.name, avg(jobs.level_of_interest) AS avg').joins(:jobs).group('companies.id').order('avg DESC')
    companies[0..2]
  end
end
