class Task < ApplicationRecord
  TYPES = [
    ['fetch urls', 'Tasks::FetchUrlsTask']
  ].freeze
  
  belongs_to :user
  enum status: [:pending, :running, :completed, :failed]
end
