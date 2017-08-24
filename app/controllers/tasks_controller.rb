class TasksController < ApplicationController
  include Pundit
  inherit_resources
  decorates_assigned :tasks

  helper_method :task_form_props, :current_url

  def index
    fetch_category
    fetch_scope
    super
  end

  def show
    return redirect_to deal_path(resource.deal) if resource.deal.present? && policy(resource.deal).show?
  end

  def new
    authorize Task
    run Task::Operation::Present
  end

  def create
    authorize Task
    run Task::Operation, task_params do |result|
      sign_in result['sign_in_new_user'] if result['sign_in_new_user']
      return redirect_to task_path(result['model']), notice: 'Задание добавлено'
    end

    render 'new'
  end

  private

    def end_of_association_chain
      TaskQuery.new(collection: super, scope: @scope, category: @category, current_user: current_user).perform
    end

    def fetch_scope
      @scope = :all
      @scope = params[:scope].to_sym if params[:scope]
      not_found unless @scope.in? [:all, :my, :suggested]
    end

    def fetch_category
      @category = Category.friendly.find params[:category_id] if params[:category_id]
    end

    def task_params
      params.require(:task).permit!
    end

    def current_url category:
      params = {}
      params[:category_id] = category if category
      if @scope == :my
        my_tasks_path(params)
      elsif @scope == :suggested
        suggested_tasks_path(params)
      else
        category_tasks_path(params)
      end
    end

    def form_from_session
      @form.validate create_data_after_authorization(:task) if create_after_authorization? :task
    end

    def store_form_to_session
      @form.save do |data|
        create_after_authorization :task, data
      end
    end
end
