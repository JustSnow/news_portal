# sphinx: bundle exec rake thinking_sphinx:run_in_foreground RAILS_ENV=development --trace
# web: bundle exec rails s
web: bundle exec unicorn -p $PORT -c ./config/unicorn.rb
sidekiq_worker: bundle exec sidekiq
sidekiq_web: bundle exec rackup sidekiq.ru
