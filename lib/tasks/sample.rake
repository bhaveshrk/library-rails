namespace :sample do
  desc "Hello Cron"
  task test: :environment do
    pp 'hi cron :)'
  end

end
