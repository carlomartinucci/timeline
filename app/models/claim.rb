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
  has_many :nop_evidences
  has_many :involvements

  validates :title, presence: true
end
