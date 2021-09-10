//
//  ScoreView.swift
//  Fleaflicker
//
//  Created by Stu Greenham on 06/05/2021.
//

import SwiftUI

struct ScoreView: View {
    
    //: MARK: - PROPERTIES
    
    struct LeagueGame: Hashable {
        var leagueId: Int
        var leagueName: String
        var awayId: Int
        var awayName: String
        var awayScore: String
        var awayToPlay: Int
        var homeId: Int
        var homeName: String
        var homeScore: String
        var homeToPlay: Int
    }
    
    // VAR TO HOLD JSON DATA
    @State var leagues = [League]()
    @State var games = [Game]()
    @State var myGames: [LeagueGame] = []
    
    
    //: MARK: - BODY
    
    var body: some View {
        
        NavigationView {
            
            List {
                ForEach(myGames, id: \.self) { game in
                    VStack(alignment: .leading) {
                        Text(game.leagueName)
                            .font(.headline)
                        
                        // AWAY TEAM
                        HStack {
                            // NAME
                            Text(game.awayName)
                            Text("(\(game.awayToPlay))")
                                .font(.footnote)
                                .foregroundColor(.gray)
                            
                            Spacer()
                            
                            // SCORE
                            Text(game.awayScore)
                        }
                        .font(.subheadline)
                        .padding(.top, 2)
                            
                        // HOME TEAM
                        HStack {
                            // NAME
                            Text(game.homeName)
                            Text("(\(game.homeToPlay))")
                                .font(.footnote)
                                .foregroundColor(.gray)
                            
                            Spacer()
                            
                            // SCORE
                            Text(game.homeScore)
                        }
                        .font(.subheadline)
                        .padding(.top, 2)
                        
                    }
                    .padding(.vertical, 8)
                }
            }
            .navigationBarTitle("Scores", displayMode: .large)
            .listStyle(PlainListStyle())
            .onAppear(perform: loadLiveScoresFromAllLeagues)
            .toolbar {
                #if os(iOS)
                // REFRESH DATA
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        loadLiveScoresFromAllLeagues()
                    }, label: {
                        Image(systemName: "arrow.clockwise.circle")
                    })
                }
                #endif
            }
            
        } //: NAV
    }
    

    
    //: MARK: - FUNCTIONS
    
    private func loadLiveScoresFromAllLeagues() {
        
        // RESET DATA
        myGames.removeAll()
        
        // GRAB LIST OF LEAGUE/TEAMS FOR USER
        loadLeagueData()
        
        // LOOP ALL OF TEAMS AND GRAB LIVE SCORES
//        for league in leagues {
////            print("League ID: \(league.id)")
//            loadLiveScoreData(leagueId: league.id, teamId: league.ownedTeam.id)
//        }
        
    }
    
    
    private func loadLeagueData() {
        guard let url = URL(string: "https://www.fleaflicker.com/api/FetchUserLeagues?sport=NFL&user_id=1034407") else {
            print("Invalid URL")
            return
        }
        
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                do {
                    let decodedReponse = try JSONDecoder().decode(LeagueResponse.self, from: data)
                    DispatchQueue.main.async {
                        self.leagues = decodedReponse.leagues
                        
                        for league in leagues {
                            loadLiveScoreData(leagueId: league.id, leagueName: league.name, ownedTeamId: league.ownedTeam.id)
                        }
                        
                    }
                    
                    return
                } catch {
                    print(error)
                }
            }
            
            print("Fetch failed: \(error?.localizedDescription ?? "Unknown error")")
        }.resume()
    } //: FUNC
    
    
    private func loadLiveScoreData(leagueId: Int, leagueName: String, ownedTeamId: Int) {
        guard let url = URL(string: "https://www.fleaflicker.com/api/FetchLeagueScoreboard?league_id=\(leagueId)") else {
            print("Invalid URL")
            return
        }
        
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                do {
                    let decodedReponse = try JSONDecoder().decode(ScoreResponse.self, from: data)
                    DispatchQueue.main.async {
                        
                        // grab list of game from the league id passed in
                        let tempGames = decodedReponse.games
                        
                        // filter games to just my team using the team id passed in
                        self.games = tempGames.filter { $0.home.id == ownedTeamId || $0.away.id == ownedTeamId }
                        
                        // print("Filtered Game Count: \(games.count)")
                        
                        // create a var to store the game info
                        let currentGame = LeagueGame(
                            leagueId: leagueId,
                            leagueName: leagueName,
                            awayId: games[0].away.id,
                            awayName: games[0].away.name,
                            awayScore: games[0].awayScore.score.formatted,
                            awayToPlay: games[0].awayScore.yetToPlay,
                            homeId: games[0].home.id,
                            homeName: games[0].home.name,
                            homeScore: games[0].homeScore.score.formatted,
                            homeToPlay: games[0].homeScore.yetToPlay
                        )
                        
                        // append the game to the games array to be displayed on screen
                        myGames.append(currentGame)
                        // print(myGames)
                        
                    }
                    
                    return
                } catch {
                    print(error)
                }
            }
            
            print("Fetch failed: \(error?.localizedDescription ?? "Unknown error")")
        }.resume()
    } //: FUNC
    
    
}

struct ScoreView_Previews: PreviewProvider {
    static var previews: some View {
        ScoreView()
    }
}


