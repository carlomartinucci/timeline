# == Schema Information
#
# Table name: nop_evidences
#
#  id         :integer          not null, primary key
#  claim_id   :integer
#  source_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class NopEvidence < ApplicationRecord
  belongs_to :claim
  belongs_to :source
end
