RSpec.configure do |config|
  config.before(:suite) do
    if ENV['DATABASE_CLEANER_ALLOW_REMOTE_DATABASE_URL'] == 'true' || ENV['DATABASE_URL']
      DatabaseCleaner.allow_remote_database_url = true
    end
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before do
    DatabaseCleaner.strategy = :transaction
  end

  config.before do
    DatabaseCleaner.start
  end

  config.after do
    DatabaseCleaner.clean
  end
end
