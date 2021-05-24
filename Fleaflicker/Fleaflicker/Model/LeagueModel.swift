//
//  LeagueModel.swift
//  Fleaflicker
//
//  Created by Stu Greenham on 10/05/2021.
//

import SwiftUI

/*
- https://www.fleaflicker.com/api-docs/index.html
- https://www.fleaflicker.com/api/FetchUserLeagues?sport=NFL&user_id=<ID>
*/

struct LeagueResponse: Codable {
    var leagues: [League]
}

    struct League: Codable {
        var id: Int
        var name: String
        var draftStatus: String?
        var ownedTeam: LeagueTeam
    }

        struct LeagueTeam: Codable {
            var id: Int
            var name: String
            var initials: String
        }
