# == Schema Information
#
# Table name: notifications
#
#  id              :integer          not null, primary key
#  user_id         :integer
#  message         :string
#  state           :string
#  params          :text
#  notifiable_type :string
#  notifiable_id   :integer
#  read_at         :datetime
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Notification < ApplicationRecord
  serialize :params, JSON

  belongs_to :user, counter_cache: true
  belongs_to :notifiable, polymorphic: true

  validates :user, presence: true
  validates :notifiable, presence: true, unless: :notifiable_optional?
  validate :ensure_user_not_deleted, if: :user

  after_destroy :update_user_unread_notifications_count, if: :unread?

  def unread?
    !read_at
  end

  def update_user_unread_notifications_count
    user.cache_unread_notifications_count
  end

  def update_cache_unviewed_notifications_count
    cache_unviewed_notifications_count
  end

  def ensure_user_not_deleted
    errors.add :user, 'is deleted' if user.deleted?
  end
end
