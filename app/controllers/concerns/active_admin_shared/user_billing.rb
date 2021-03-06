module ActiveAdminShared::UserBilling
  extend ActiveSupport::Concern

  def self.included dsl
    transfer_money dsl
    add_task_subscription dsl
    add_reply_subscription dsl
    add_task_pack dsl
    add_reply_pack dsl
    sidebars dsl
  end

  class << self
    def transfer_money dsl
      dsl.send :member_action, :transfer_money, method: [:get, :put] do
        run Billing::ManualTransfer::Operation::Create::Present
        @billing_resource = @form

        if request.put?
          run Billing::ManualTransfer::Operation::Create, params[:billing_manual_transfer].merge(user_id: resource.id) do |result|
            return redirect_to confirm_manual_transfer_admin_billing_manual_transfer_path(result['model'])
          end
        end
      end
    end

    def add_task_subscription dsl
      dsl.send :member_action, :add_task_subscription, method: [:get, :put] do
        @billing_resource = Billing::TaskSubscription.new(user: resource)

        if request.put?
          @billing_resource.attributes = params[:billing_task_subscription].permit(:active_from, :active_to, :cost)
          if @billing_resource.save
            redirect_to resource_path, notice: 'Подписка успешно активирована'
          end
        end
      end
    end

    def add_reply_subscription dsl
      dsl.send :member_action, :add_reply_subscription, method: [:get, :put] do
        @billing_resource = Billing::ReplySubscription.new(user: resource)

        if request.put?
          @billing_resource.attributes = params[:billing_reply_subscription].permit(:active_from, :active_to, :cost)
          if @billing_resource.save
            redirect_to resource_path, notice: 'Подписка успешно активирована'
          end
        end
      end
    end

    def add_task_pack dsl
      dsl.send :member_action, :add_task_pack, method: [:get, :put] do
        @billing_resource = Billing::TaskPack.new(user: resource)

        if request.put?
          @billing_resource.attributes = params[:billing_task_pack].permit(:amount, :cost)
          if @billing_resource.save
            redirect_to resource_path, notice: 'Пакет успешно активирован'
          end
        end
      end
    end

    def add_reply_pack dsl
      dsl.send :member_action, :add_reply_pack, method: [:get, :put] do
        @billing_resource = Billing::ReplyPack.new(user: resource)

        if request.put?
          @billing_resource.attributes = params[:billing_reply_pack].permit(:amount, :cost)
          if @billing_resource.save
            redirect_to resource_path, notice: 'Пакет успешно активирован'
          end
        end
      end
    end

    def sidebars dsl
      dsl.send :sidebar, 'Биллинг', only: :show, if: proc{ authorized? :billing_log_sidebar, user } do
        render partial: 'billing_log_sidebar', locals: { user: user }
      end

      dsl.send :sidebar, 'Пакеты и подписки', only: :show, if: proc{ authorized? :billing_sidebar, user } do
        render partial: 'billing_sidebar', locals: { user: user }
      end
    end
  end
end
