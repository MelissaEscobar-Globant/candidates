namespace :candidates do
  desc 'Generate candidates CSV file'
  task :generate do
    require 'csv'
    require 'faker'

    num_records = 10_000

    file_path = Rails.root.join('public', 'candidates.csv')

    CSV.open(file_path, 'w') do |csv|
      csv << ['Name', 'Email', 'Phone Number']

      num_records.times do
        name = Faker::Name.name
        email = Faker::Internet.email
        phone_number = Faker::PhoneNumber.phone_number

        csv << [name, email, phone_number]
      end
    end

    puts "CSV file 'candidates.csv' with #{num_records} records generated successfully at #{file_path}."

    # Enqueue insertion of the records into the DB after generating the CSV
    InsertCsvRecordsJob.perform_later(file_path)
  end
end
