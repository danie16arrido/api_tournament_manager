# Setting up postgress db

Create a Postgres user for the Rails app we'll create in the next step. To do this, switch into the Postgres user:

su - postgres
Then create a user (or a "role", as Postgres calls it):

create role myapp with createdb login password 'password1';#

postgres=# CREATE ROLE api_tournamentManager with LOGIN PASSWORD 'tmanager';
\l
CREATE ROLE
postgres=# ALTER ROLE api_tournamentManager CREATEDB;
ALTER ROLE
postgres=# \du

change pg gem in rails for it to work
gem 'pg', '0.20'
then bundle install
and rake db:setup
