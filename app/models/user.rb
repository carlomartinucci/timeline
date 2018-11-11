# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

class User < ApplicationRecord
  ADMIN_EMAILS = (ENV['ADMIN_EMAILS']&.split(',').presence || []).freeze
  EDITOR_EMAILS = (ENV['EDITOR_EMAILS']&.split(',').presence || []).freeze

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def name(*_args)
    email.split('@').first
  end

  def admin?
    email.in? ADMIN_EMAILS
  end

  def editor?
    email.in? EDITOR_EMAILS
  end
end
