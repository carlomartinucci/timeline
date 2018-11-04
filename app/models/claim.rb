# == Schema Information
#
# Table name: claims
#
#  id          :integer          not null, primary key
#  title       :string
#  body        :string
#  person_id   :integer
#  claimed_at  :datetime
#  happened_at :datetime
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Claim < ApplicationRecord
  belongs_to :person
  has_many :yes_evidences
  accepts_nested_attributes_for :yes_evidences, allow_destroy: true
  has_many :nop_evidences
  accepts_nested_attributes_for :nop_evidences, allow_destroy: true
  has_many :involvements
  accepts_nested_attributes_for :involvements, allow_destroy: true

  validates :title, presence: true
end
