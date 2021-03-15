desc "clears the cache"
task clear_cache: :environment do
  Rails.cache.clear
end

namespace :active_storage do
  desc "Purges unattached Active Storage blobs. Run regularly."
  task purge_unattached: :environment do
    files = ActiveStorage::Blob.unattached.where("active_storage_blobs.created_at <= ?", 2.days.ago)
    puts "purge: #{files.count} files."
    files.find_each(&:purge_later)
  end
end
