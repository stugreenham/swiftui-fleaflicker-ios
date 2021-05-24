//
//  DraftBoardModel.swift
//  Fleaflicker
//
//  Created by Stu Greenham on 10/05/2021.
//

import SwiftUI

/*
- https://www.fleaflicker.com/api-docs/index.html
- https://www.fleaflicker.com/api/FetchLeagueDraftBoard?sport=NFL&league_id=<ID>
*/

struct DraftResponse: Codable {
    var draftOrder: [DraftOrder]
    var rows: [DraftRow]
    var isInProgress: Bool?
}

struct DraftOrder: Codable, Equatable, Hashable  {
    var id: Int
    var name: String
}

    struct DraftRow: Codable, Equatable, Hashable {
        var round: Int
        var cells: [DraftCell]
    }

        struct DraftCell: Codable, Equatable, Hashable {
            var team: DraftTeam
            var player: DraftPlayer?
            var slot: DraftSlot
            var color: String?
            var onTheClock: Bool?
        }

            struct DraftTeam: Codable, Equatable, Hashable {
                var id: Int
                var name: String
                var initials: String
            }

            struct DraftPlayer: Codable, Equatable, Hashable {
                var proPlayer: DraftProPlayer
            }

                struct DraftProPlayer: Codable, Equatable, Hashable {
                    var id: Int
                    var nameFull: String
                    var nameShort: String
                    var proTeamAbbreviation: String
                    var position: String
                }

            struct DraftSlot: Codable, Equatable, Hashable {
                var round: Int
                var slot: Int
                var overall: Int
            }
