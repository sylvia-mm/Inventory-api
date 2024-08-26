# exit on error
set -o errexit

echo "Starting bundle install"
bundle install

echo "Starting assets precompile"
bundle exec rails assets:precompile

echo "Cleaning assets"
bundle exec rails assets:clean

echo "Running database migrations"
bundle exec rails db:migrate

echo "Seeding database"
bundle exec rails db:seed

echo "Render-build.sh script completed"
