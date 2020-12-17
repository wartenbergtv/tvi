class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

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
