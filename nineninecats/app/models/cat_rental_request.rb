# == Schema Information
#
# Table name: cat_rental_requests
#
#  id         :integer          not null, primary key
#  cat_id     :integer          not null
#  start_date :date             not null
#  end_date   :date             not null
#  status     :string           default("PENDING")
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class CatRentalRequest < ApplicationRecord
  STATUS = %w(APPROVED PENDING DENIED)
  validates :cat_id, :start_date, :end_date, :status, presence: true
  validates :status, inclusion: STATUS
  belongs_to :cat

  def overlapping_requests
    CatRentalRequest
      .where(cat_id: cat_id)
      .where.not(id: id)
      .where('(start_date BETWEEN :start AND :end) OR (end_date BETWEEN :start AND :end)', start: start_date.beginning_of_day, end: end_date.end_of_day)
  end

  def overlapping_approved_requests
    self.overlapping_requests.where(status: 'APPROVED')
  end

  def does_not_overlap_approved_request
    !self.overlapping_approved_requests.exists?
  end

  def approve!
    # if does_not_overlap_approved_request
    # change status of CatRentalRequest to appvoed

    CatRentalRequest.transaction do
      if does_not_overlap_approved_request
        # byebug
        self.status = 'APPROVED'
        overlapping_requests.each do |request|
          request.status = 'DENIED'
          request.save!
        end
        self.save
      else
        status = 'DENIED'
        self.save
      end
    end
  end

  def deny!
    self.status = 'DENIED'
    self.save
  end

end
