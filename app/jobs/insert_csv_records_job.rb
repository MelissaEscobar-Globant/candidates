class InsertCsvRecordsJob
  @queue = :default

  def self.perform_later(file_path)
    CSV.foreach(file_path, headers: true) do |row|
      Candidate.create(name: row['Name'], email: row['Email'], phone_number: row['Phone Number'])
    end
  end
end
