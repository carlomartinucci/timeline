# == Schema Information
#
# Table name: involvements
#
#  id         :integer          not null, primary key
#  person_id  :integer
#  claim_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Involvement < ApplicationRecord
  belongs_to :person
  belongs_to :claim
end
