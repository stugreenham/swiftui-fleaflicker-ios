//
//  LeagueView.swift
//  Fleaflicker
//
//  Created by Stu Greenham on 06/05/2021.
//

import SwiftUI

struct LeagueView: View {
    
    //: MARK: - PROPERTIES
    
    // VAR TO STORE LEAGUE JSON DATA
    @State var leagues = [League]()
    
    
    //: MARK: - BODY
    var body: some View {
        
        NavigationView {
            List(leagues, id: \.id) { item in
                LeagueListRowView(
                    leagueId: item.id,
                    leagueName: item.name,
                    teamId: item.ownedTeam.id,
                    teamName: item.ownedTeam.name
                )
            } //: LIST
            .navigationBarTitle("Leagues", displayMode: .large)
            .listStyle(PlainListStyle())
            .onAppear(perform: loadLeagueData)
            .toolbar {
                #if os(iOS)
                // REFRESH DATA
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        // Do Something
                    }, label: {
                        Image(systemName: "gearshape")
                    })
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        loadLeagueData()
                    }, label: {
                        Image(systemName: "arrow.clockwise.circle")
                    })
                }
                #endif
            }
        } //: NAV
        
        
    }
    
    //: MARK: - FUNCTIONS
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

struct LeagueView_Previews: PreviewProvider {
    static var previews: some View {
        LeagueView()
    }
}
