# == Schema Information
#
# Table name: user_billing_logs
#
#  id                          :integer          not null, primary key
#  sum                         :float
#  user_id                     :integer
#  billable_type               :string
#  billable_id                 :integer
#  created_at                  :datetime         not null
#  updated_at                  :datetime         not null
#  state                       :string
#  finish_after_billing_log_id :integer
#

class User::BillingLog < ApplicationRecord
  include AASM

  belongs_to :user
  belongs_to :billable, polymorphic: true
  belongs_to :finish_after, class_name: '::User::BillingLog', foreign_key: 'finish_after_billing_log_id'

  scope :latest, -> { order('created_at DESC') }

  aasm column: :state do
    state :new, initial: true
    state :finished, :failed

    event :finish do
      transitions from: :new, to: :finished
    end

    event :fail do
      transitions from: :new, to: :failed
    end
  end
end
