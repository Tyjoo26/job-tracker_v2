class Comment < ApplicationRecord
  validates_presence_of :content, presence: true

  belongs_to :job
end
