class UrlValidator < ActiveModel::EachValidator
  def self.valid_url?(url)
    uri = URI.parse(url)
    uri.is_a?(URI::HTTP) && uri.host.present?
  rescue URI::InvalidURIError
    false
  end

  def validate_each(record, attribute, url)
    record.errors.add(attribute, "is not a valid URL") if url.present? && !self.class.valid_url?(url)
  end
end
