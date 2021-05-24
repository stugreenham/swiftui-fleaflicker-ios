//
//  RosterModel.swift
//  Fleaflicker
//
//  Created by Stu Greenham on 10/05/2021.
//

import SwiftUI

/*
- https://www.fleaflicker.com/api-docs/index.html
- https://www.fleaflicker.com/api/FetchRoster?sport=NFL&league_id=<ID>&team_id=<ID>
*/

struct RosterResponse: Codable {
    var groups: [Group]
}

    struct Group: Codable {
        var group: String?
        var slots: [Slot]
    }

        struct Slot: Codable, Equatable, Hashable {
            var position: Position
            var leaguePlayer: LeaguePlayer?
        }

            struct Position: Codable, Equatable, Hashable {
                var label: String
            }

            struct LeaguePlayer: Codable, Equatable, Hashable {
                var displayGroup: String
                var proPlayer: ProPlayer?
            }

                struct ProPlayer: Codable, Equatable, Hashable {
                    var id: Int
                    var nameFull: String
                    var position: String
                }
