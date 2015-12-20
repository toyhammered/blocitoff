namespace :todo do
  desc "Delete expired items that are over 15 days old"
  task delete_expired_items: :environment do
    Item.where(created_at: (Time.now - 15.days), completed_at: nil).destroy_all
  end
end
