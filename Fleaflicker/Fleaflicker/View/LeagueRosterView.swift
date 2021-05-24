//
//  LeagueRosterView.swift
//  Fleaflicker
//
//  Created by Stu Greenham on 10/05/2021.
//

import SwiftUI

struct LeagueRosterView: View {
    
    //: MARK: - PROPERTIES
    
    // TOGGLE FOR MODAL SHEET
    @State private var showingSheet = false
    
    // VAR TO HOLD JSON RESULTS
    @State var groups = [Group]()
    
    // VARS TO HOLD DATA PASSED INTO THE VIEW
    let leagueId: Int
    let teamId: Int
    let teamName: String
    
    
    //: MARK: - BODY
    var body: some View {
        
        List(groups, id: \.group) { group in
            
            VStack(alignment: .leading, spacing: 4) {
                
                // ROSTER GROUP TITLE
                RosterHeaderView(groupName: group.group ?? "")
                
                // ROSTER PLAYER LIST
                ForEach(group.slots, id: \.self) { slot in
                    RosterPlayerView(slot: slot)
                }
                
            } //: VSTACK
            .padding(.vertical, 8)
            
        } //: LIST
        .listStyle(PlainListStyle())
        .navigationBarTitle(teamName, displayMode: .large)
        .toolbar {
            #if os(iOS)
            // DRAFT BOARD (DISPLAY MODAL)
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    showingSheet = true
                }, label: {
                    Image(systemName: "list.number")
                    //Text("Draft Board")
                })
            }
            
            // REFRESH DATA
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    loadTeamData()
                }, label: {
                    Image(systemName: "arrow.clockwise.circle")
                })
            }
            #endif
        }
        .sheet(isPresented: $showingSheet, content: {
            DraftBoardView(isPresented: $showingSheet, leagueId: leagueId)
        })
        .onAppear(perform: loadTeamData)
    
    }
    
    
    //: MARK: - FUNCTIONS
    func loadTeamData() {
        guard let url = URL(string: "https://www.fleaflicker.com/api/FetchRoster?sport=NFL&league_id=\(leagueId)&team_id=\(teamId)") else {
            print("Invalid URL")
            return
        }
        
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                do {
                    let decodedReponse = try JSONDecoder().decode(RosterResponse.self, from: data)
                    DispatchQueue.main.async {
                        self.groups = decodedReponse.groups
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

struct LeagueRosterView_Previews: PreviewProvider {
    static var previews: some View {
        LeagueRosterView(leagueId: 320927, teamId: 1626358, teamName: "Soldier Fields")
    }
}
