class GenerateCsvJob
  @queue = :default

  def self.perform_later
    begin
      Rails.application.load_tasks
      Rake::Task['candidates:generate'].invoke
    rescue StandardError => e
      Rails.logger.error("Error generating candidates CSV: #{e.message}")
    end
  end
end