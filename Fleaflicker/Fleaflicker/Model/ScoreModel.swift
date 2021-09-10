//
//  ScoreModel.swift
//  Fleaflicker
//
//  Created by Stu Greenham on 10/09/2021.
//

import SwiftUI

/*
- https://www.fleaflicker.com/api-docs/index.html
- https://www.fleaflicker.com/api/FetchLeagueScoreboard?league_id=<ID>&team_id=<ID>
*/

struct ScoreResponse: Codable {
    var games: [Game]
}

    struct Game: Codable {
        var id: String
        var away: Away
        var home: Home
        var awayScore: AwayScore
        var homeScore: HomeScore
    }

        struct Away: Codable {
            var id: Int         // team id
            var name: String    // team name
        }

        struct Home: Codable {
            var id: Int         // team id
            var name: String    // team name
        }

        struct AwayScore: Codable {
            var yetToPlay: Int
            var score: Score
        }

        struct HomeScore: Codable {
            var yetToPlay: Int
            var score: Score
        }
    
            struct Score: Codable {
                var formatted: String
            }
