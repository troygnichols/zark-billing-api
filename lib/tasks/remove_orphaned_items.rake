namespace :zark do
  desc "Remove orphaned items from the database"
  task remove_orphaned_items: :environment do
    Item.includes(:invoice).find_each do |item|
      if item.invoice.nil?
        puts "Deleting orphaned item: #{item}"
        item.delete
      end
    end
  end
end
