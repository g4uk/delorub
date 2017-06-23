class TaskForm < BaseForm
  property :title
  property :description

  property :category_id
  property :main_category_id

  property :date_type, default: 'actual'
  property :date_actual_date, default: -> { I18n.l(Time.zone.now + 1.day, format: :date) }
  property :date_actual_time, default: -> { I18n.l(Time.zone.now, format: :timeofday) }
  property :date_interval_from_date, default: -> { I18n.l(Time.zone.now, format: :date) }
  property :date_interval_to_date, default: -> { I18n.l(Time.zone.now + 1.day, format: :date) }

  property :price_type, default: 'exact'
  property :price_exact, default: 1000
  property :price_from
  property :price_to

  property :place_id
  property :place_address

  collection :files,
    populator: ->(fragment:, **) {
      item = files.find { |file| file.id == fragment['id'].to_i }
      item ? item : files.append(TaskFile.find_by(id: fragment['id']))
    } do
    property :id
  end

  property :contract_type, default: 'no_contract'

  property :notifications_type, virtual: true, default: 'notifications-email'
  property :paid_functions, virtual: true, default: []

  validation :default do
    required(:title).filled
    required(:description).filled
    required(:category_id).filled
  end

  def contract_type_options
    Task.contract_type.options
  end

  def date_type_options
    Task.date_type.options
  end

  def price_type_options
    Task.price_type.options
  end

  def notifications_type_options
    [
      ['На email и в уведомлениях', 'notifications-email'],
      ['Только уведомления', 'notifications']
    ]
  end

  def paid_functions_options
    [
      ['Выделить цветом', 'color'],
      ['Поднять вверх', 'stick']
    ]
  end
end