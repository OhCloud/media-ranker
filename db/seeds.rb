# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#there is where seed info goes
# movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
# Character.create(name: 'Luke', movie: movies.first)
require "csv"
WORKS_FILE = Rails.root.join("db", "media-seeds.csv")
puts "Loading raw work data from #{WORKS_FILE}"
work_failures = []
CSV.foreach(WORKS_FILE, :headers => true) do |row|
  work = Work.new
  work.category = row["category"]
  work.title = row["title"]
  work.creator = row["creator"]
  work.publication_date = row["publication_date"].to_i
  work.description = row["description"]
  successful = work.save
  if !successful
    work_failures << work
    puts "Failed to save work: #{work.inspect}"
    puts "#{work.errors.messages}"
    puts "\n\n\n*****#{work.publication_date}*****"
  else
    puts "Created work: #{work.inspect}"
  end
end
puts "Added #{Work.count} work records"
puts "#{work_failures.length} works failed to save"
puts "done"