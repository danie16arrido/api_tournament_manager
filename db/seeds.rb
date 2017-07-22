# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Team.delete_all
League.delete_all

leagueA = League.create( { name: "FA Cup"});
leagueB = League.create( { name: "Spanish Cup"});

team1 = Team.create( { name:"Chelsea", league: leagueA} );
team2 = Team.create( { name:"Liverpool", league: leagueA} );