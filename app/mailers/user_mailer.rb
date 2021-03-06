class UserMailer < ApplicationMailer
  add_template_helper(BillingHelper)

  def welcome user:, password:
    @user = user.decorate
    @password = password
    mail to: @user.email, subject: 'Регистрация на ДелоРубе'
  end

  def create_profile user:
    @user = user.decorate
    mail to: @user.email, subject: 'Создание профиля исполнителя'
  end

  def yandex_deposit_finish model:
    @model = model
    @user = @model.user.decorate
    mail to: @user.email, subject: 'Пополнение баланса'
  end

  def buy_delocoin model:
    @model = model
    @user = @model.user.decorate
    mail to: @user.email, subject: 'Покупка Делокоинов'
  end
end
