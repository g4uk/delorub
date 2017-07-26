module VisitorSession
  extend ActiveSupport::Concern

  included do
    before_action :visitor_initialize_session
    before_action :visitor_check_global_referer
    before_action :visitor_check_utm
  end

  protected

    def visitor_initialize_session
      return if session[:visitor].present?
      session[:visitor] = {}
      visitor_set_timestamp
    end

    def visitor_check_global_referer
      return if request.referer.blank?
      return if URI(request.url).host == URI(request.referer).host
      session[:visitor][:referer] = request.referer
      visitor_set_timestamp
    end

    def visitor_check_utm
      return unless request.get?
      return if request.params[:utm_source].blank?
      session[:visitor][:utm_data] = request.params
    end

    def visitor_set_timestamp
      session[:visitor][:visited_at] = Time.zone.now
    end
end
