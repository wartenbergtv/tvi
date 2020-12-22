class WelcomeController < ApplicationController
  def index
    @episodes = EpisodePresenter.wrap Episode.active. order("number DESC").limit(3)
  end

  def imprint
    render html: markdown_processor.render(current_setting.imprint).html_safe, layout: true
  end

  def privacy
    render html: markdown_processor.render(current_setting.privacy).html_safe, layout: true
  end

  def about
    render html: markdown_processor.render(current_setting.about).html_safe, layout: true
  end
end
