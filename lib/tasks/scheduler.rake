namespace :scheduler do
  desc "Delete expired items that are over 15 days old"
  task delete_expired_items: :environment do
    puts "*" * 10
    puts "Deleting expired Items"
    # remember it has already been 7 days because that is when it expires. 
    expired = Item.where(completed_at: nil).where.not(created_at: 14.days.ago...Time.now)
    expired.destroy_all
    puts "*" * 10
  end
end
