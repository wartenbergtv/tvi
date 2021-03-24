class RemoteFileStatus < BaseService
  attr_accessor(:url)

  def call
    remote_file_exits? url
  end

  private

  def remote_file_exits?(url, method: :get)
    Rails.logger.info "check url: #{url}"
    conn = Faraday.new do |b|
      b.use FaradayMiddleware::FollowRedirects
      b.adapter :net_http
      b.options.timeout = 3
    end
    request = conn.send method, url
    Rails.logger.info "status: #{request.status}"
    request.success?
  rescue Faraday::Error, Faraday::Error::ConnectionFailed => e
    Rails.logger.fatal e
    nil
  end
end
