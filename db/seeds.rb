# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# `rake db:reset db:migrate`
Card.delete_all
Goal.delete_all
Player.delete_all
Team.delete_all

Match.delete_all
Location.delete_all
Referee.delete_all
League.delete_all


leagueA = League.create( { name: "FA Cup"});
leagueB = League.create( { name: "Spanish Cup"});

team1 = Team.create( { name:"Chelsea", league: leagueA} );
team2 = Team.create( { name:"Liverpool", league: leagueA} );
team3 = Team.create( { name:"Boca Juniors", league: leagueA} );
team4 = Team.create( { name:"Sao Paolo", league: leagueA} );

player1 = Player.create( { name:"Daniel" , last_name:"Garrido" , team: team1, age: 40, height: 1.81 ,weight: 82.33  } );
player2 = Player.create( { name:"Leo" , last_name:"Messi" , team: team1 , age: 33 ,height: 1.03 ,weight: 60.8  } );
player3 = Player.create( { name:"Cristiano" , last_name:"Ronaldo" , team: team2 , age: 34 ,height: 1.83 ,weight: 78.8  } );
player4 = Player.create( { name:"Zico" , last_name:"DaSilva" , team: team3, age: 40, height: 1.81 ,weight: 82.33  } );
player5= Player.create( { name:"Edson" , last_name:"Arantes" , team: team3 , age: 33 ,height: 1.03 ,weight: 60.8  } );
player6 = Player.create( { name:"Favio" , last_name:"Canavaro" , team: team4 , age: 34 ,height: 1.83 ,weight: 78.8  } );

location1 = Location.create( { name:"Edinburgh Uni B", league:leagueA } );
location2 = Location.create( { name:"Holyroot", league:leagueA, lat:55.943579, lng:-3.161584 } );

referee1 = Referee.create( { name:"John", last_name:"Smith", league:leagueA } );
referee2 = Referee.create( { name:"Carlos", last_name:"Carlton", league:leagueA } );

match1 = Match.create(  { home:team1, away:team2, date:"2017-07-23", time:"10:30:00", league: leagueA, location: location1, referee: referee1 } );
match2 = Match.create(  { home:team4, away:team3, date:"2017-07-23", time:"15:30:00", league: leagueA, location: location2, referee: referee2 } );

card1 = Card.create( { player:player1, match:match1, minute:44, colour:"yellow" } );
card2 = Card.create( { player:player2, match:match1, minute:90, colour:"red" } );

card3 = Card.create( { player:player4, match:match2, minute:4, colour:"yellow" } );
card4 = Card.create( { player:player6, match:match2, minute:19, colour:"red" } );

goal1 = Goal.create( { player:player1, match:match1, minute:22, category:"standart" } );
goal2 = Goal.create( { player:player2, match:match1, minute:66, category:"penalty" } );

goal3 = Goal.create( { player:player6, match:match2, minute:16, category:"standard" } );