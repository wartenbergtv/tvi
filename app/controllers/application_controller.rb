class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  rescue_from ActiveRecord::RecordNotFound, ActionController::RoutingError, with: :render_404

  def not_found
    raise ActionController::RoutingError, "Not Found"
  end

  def render_404
    respond_to do |format|
      format.html { render file: Rails.root.join("public/404.html"), layout: false, status: :not_found }
      format.xml  { head :not_found }
      format.any  { head :not_found }
    end
  end

  protected

  def authorize_admin
    redirect_to root_path, alert: "Access Denied" unless current_user&.admin?
  end

  def current_setting
    @current_setting ||= Setting.new
  end

  def markdown_processor
    @markdown_processor ||= Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true, tables: true)
  end
end
