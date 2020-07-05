class Task < ApplicationRecord
  TYPES = [
    ['fetch urls', 'Tasks::FetchUrlsTask']
  ].freeze
  
  belongs_to :user
  enum status: [:pending, :running, :completed, :failed]
  jsonb_accessor :args,
    category: :string,
    email: :string
  validates :category, :email, presence: true
end
