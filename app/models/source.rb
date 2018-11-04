# == Schema Information
#
# Table name: sources
#
#  id          :integer          not null, primary key
#  title       :string
#  body        :string
#  person_id   :integer
#  released_at :datetime
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  url         :string
#

class Source < ApplicationRecord
  belongs_to :person
  has_many :yes_evidences
  has_many :nop_evidences
end
