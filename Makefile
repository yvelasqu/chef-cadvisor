.PHONY: chefspec

rubocop:
	bundle install --jobs 8 && bundle exec rubocop --format progress --format html -o reports/rubocop/index.html

foodcritic:
	bundle install --jobs 8 && bundle exec foodcritic .

chefspec:
	bundle install && bundle exec berks install && bundle exec rspec

check: rubocop foodcritic chefspec
