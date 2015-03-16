class Task < ActiveRecord::Base
  belongs_to :list

  scope :done, -> { where(done: true) }
  scope :not_done, -> { where(done: false) }
  validates :description, :presence => true


end
