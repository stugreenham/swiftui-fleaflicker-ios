//
//  RosterPlayerView.swift
//  Fleaflicker
//
//  Created by Stu Greenham on 10/05/2021.
//

import SwiftUI

struct RosterPlayerView: View {
    
    //: MARK: - PROPERTIES
    let slot: Slot
    
    //: MARK: - BODY
    var body: some View {
        
        // IF TO REMOVE EMPTY BENCH SPACES
        if slot.leaguePlayer != nil {
            HStack {
                // PLAYER NAME
                Text(slot.leaguePlayer!.proPlayer!.nameFull)
                
                Spacer()
                
                // PLAYER POSITION
                Text(slot.leaguePlayer!.proPlayer!.position)
            }
            .padding(.vertical, 4)
        }

    }
}


