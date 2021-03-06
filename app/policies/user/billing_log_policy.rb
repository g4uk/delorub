class User::BillingLogPolicy < ApplicationPolicy
  def create?
    user.present?
  end

  def finish?
    record.may_finish? && owner?
  end

  def confirm?
    finish?
  end

  def status?
    owner?
  end

  def fail?
    record.may_fail? && owner?
  end
end
