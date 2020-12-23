desc "clears the cache"
task clear_cache: :environment do
  Rails.cache.clear
  Rails.cache.dalli.flush
  Rails.cache.dalli.reset_stats
end
