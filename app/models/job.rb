# == Schema Information
#
# Table name: jobs
#
#  id         :integer          not null, primary key
#  person_id  :integer
#  name       :string
#  started_at :datetime
#  ended_at   :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Job < ApplicationRecord
  belongs_to :person

  validates :name, presence: true
  validates :started_at, presence: true

  def self.current_or_last
    where(ended_at: nil).order(started_at: :desc).first || order(ended_at: :desc).first
  end
end
