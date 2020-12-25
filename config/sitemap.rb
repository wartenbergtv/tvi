# Set the host name for URL creation
host = if Rails.env.test?
         "wartenberger.test.com"
       elsif Rails.env.development?
         "localhost:3000"
       else
         ENV["DEFAULT_URL_HOST"] || "#{ENV.fetch('HEROKU_APP_NAME')}.herokuapp.com"
       end

protocol = Rails.application.config.force_ssl ? "https" : "http"

SitemapGenerator::Sitemap.default_host = "#{protocol}://#{host}"

SitemapGenerator::Sitemap.public_path = "tmp/sitemap"
# Where you want your sitemap.xml.gz file to be uploaded.

SitemapGenerator::Sitemap.adapter = SitemapGenerator::AwsSdkAdapter.new(
  Rails.application.connfig.aws_bucket_name,
  aws_access_key_id: Rails.application.connfig.aws_access_key,
  aws_secret_access_key: Rails.application.connfig.aws_secret_key,
  aws_region: Rails.application.connfig.aws_s3_region
)
# SitemapGenerator::Sitemap.adapter = SitemapGenerator::S3Adapter.new(
# aws_access_key_id: "AKIAXCA2FZPHSYMQBANA", # ENV["S3_ACCESS_KEY"],
# aws_secret_access_key: "", #ENV["S3_SECRET_KEY"],
# fog_provider: 'AWS',
# fog_directory: "wartenberger-podcast", #ENV["S3_BUCKET_NAME"],
# fog_region: "eu-central-1" #ENV["S3_REGION"]
# )

# The full path to your bucket
SitemapGenerator::Sitemap.sitemaps_host = "https://#{Rails.application.connfig.aws_bucket_name}.s3.amazonaws.com"

if Rails.application.connfig.aws_bucket_name.present?

  SitemapGenerator::Sitemap.create do
    add "/about", changefreq: "weekly"
    add "/imprint", changefreq: "weekly"
    add "/privacy", changefreq: "weekly"

    add episodes_path, priority: 0.7, changefreq: "weekly"

    Episode.published.each do |episode|
      add episode_path(episode), changefreq: "weekly", lastmod: episode.updated_at
    end
  end

else

  puts "ERROR: aws s3 is not cofigured"

end
