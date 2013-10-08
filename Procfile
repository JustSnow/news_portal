# sphinx: bundle exec rake thinking_sphinx:run_in_foreground RAILS_ENV=development --trace
web: bundle exec rails s
# web: bundle exec unicorn -p 3000 -c ./config/unicorn.rb
sidekiq_worker: bundle exec sidekiq
sidekiq_web: bundle exec rackup sidekiq.ru
