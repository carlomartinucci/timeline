# == Schema Information
#
# Table name: people
#
#  id         :integer          not null, primary key
#  name       :string
#  born_at    :datetime
#  dead_at    :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Person < ApplicationRecord
  has_many :jobs
  has_many :sources
  has_many :claims
  has_many :involvements

  validates :name, presence: true
end
