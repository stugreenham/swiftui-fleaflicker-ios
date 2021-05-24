//
//  LeagueRow.swift
//  Fleaflicker
//
//  Created by Stu Greenham on 05/05/2021.
//

import SwiftUI

struct LeagueRow : View {
    
    var league: League
    
    var body: some View {
        
        HStack {
            Text(league.name)
                .font(.headline)
//            Text(league.id)
//                .font(.footnote)
        }
        
    }

}
