# == Schema Information
#
# Table name: cats
#
#  id          :integer          not null, primary key
#  birth_date  :date             not null
#  color       :string           not null
#  name        :string           not null
#  sex         :string           not null
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Cat < ApplicationRecord
  include ActionView::Helpers::DateHelper
  COLORS = %w(red orange yellow green blue indigo violet white black)
  validates :color, inclusion: COLORS
  validates :birth_date, :sex, :name, :color, presence: true

  def age
    time_ago_in_words(birth_date)
  end

  has_many :cat_rental_requests,
  dependent: :destroy

end
