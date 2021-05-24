//
//  LeagueListRowView.swift
//  Fleaflicker
//
//  Created by Stu Greenham on 08/05/2021.
//

import SwiftUI

struct LeagueListRowView: View {
    
    //: MARK: - PROPERTIES
    let leagueId: Int
    let leagueName: String
    let teamId: Int
    let teamName: String
    
    
    //: MARK: - BODY
    var body: some View {
        
        // NAV LINK THROUGH TO TEAM ROSTER VIEW
        NavigationLink(
            destination: LeagueRosterView(
                leagueId: leagueId,
                teamId: teamId,
                teamName: teamName
            )
        ) {
        
            VStack(alignment: .leading, spacing: 4) {
                Text(leagueName)
                    .font(.headline)
                
                Text("Team: \(teamName)")
                    .font(.footnote)
                
                Text("League ID: \(String(leagueId))")
                    .font(.footnote)
                
            } //: VSTACK
            .padding(.vertical, 8)
            
        }
        
    }
}

//: MARK: - PREVIEW
struct LeagueListRowView_Previews: PreviewProvider {
    static var previews: some View {
        LeagueListRowView(leagueId: 1000, leagueName: "Show Me The Money SF", teamId: 1626358, teamName: "Soldier Fields")
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
