# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Player.delete_all
Team.delete_all
League.delete_all

leagueA = League.create( { name: "FA Cup"});
leagueB = League.create( { name: "Spanish Cup"});

team1 = Team.create( { name:"Chelsea", league: leagueA} );
team2 = Team.create( { name:"Liverpool", league: leagueA} );

player1 = Player.create ( { name:"Daniel" , last_name:"Garrido" , team: team1, age: 40, height: 1.81 ,weight: 82.33  } );
player2 = Player.create ( { name:"Leo" , last_name:"Messi" , team: team1 , age: 33 ,height: 1.03 ,weight: 60.8  } );
player3 = Player.create ( { name:"Cristiano" , last_name:"Ronaldo" , team: team2 , age: 34 ,height: 1.83 ,weight: 78.8  } );

