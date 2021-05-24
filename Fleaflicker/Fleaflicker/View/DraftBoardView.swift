//
//  DraftBoardView.swift
//  Fleaflicker
//
//  Created by Stu Greenham on 07/05/2021.
//

import SwiftUI

struct DraftBoardView: View {
    
    //: MARK: - PROPERTIES
    
    // VAR TO HOLD JSON DATA
    @State var draftOrder = [DraftOrder]()
    @State var rows = [DraftRow]()
    @State var isInProgress = false
    
    // VAR TO HANDLE SHEET PRESENTED STATE
    @Binding var isPresented: Bool
    let leagueId: Int
    
    
    var body: some View {
        
        NavigationView {
        
            ScrollView(.vertical, showsIndicators: false, content: {
                VStack(alignment: .leading) {
                     
                    // CHECK IF DRAFT IN PROGRESS
                    if isInProgress {
                    
//                                HStack(alignment: .top, spacing: 0) {
//                                    ForEach(draftOrder, id: \.self) { team in
//                                        DraftBoardTeamHeaderView(teamName: team.name)
//                                    } //: LOOP
//                                    .padding(.trailing, 8)
//                                }
                        
                        ForEach(rows, id: \.self) { row in
                            
                            VStack(alignment: .leading, spacing: 0) {
                                
                                // ROUND NO
                                DraftBoardRoundHeaderView(roundNo: row.round)
                                    .padding(.top)
                                    .padding(.horizontal)
                                
                                // PICK LIST
                                VStack(alignment: .leading, spacing: 0) {
                                    ForEach(row.cells, id: \.self) { cell in
                                        DraftBoardCellView(
                                            slotOverallNo: cell.slot.overall,
                                            slowOwner: cell.team.name,
                                            slotColor: cell.color ?? "default",
                                            playerName: cell.player?.proPlayer.nameFull,
                                            playerTeam: cell.player?.proPlayer.proTeamAbbreviation,
                                            playerPosition: cell.player?.proPlayer.position,
                                            onTheClock: cell.onTheClock ?? false
                                        )
                                        .padding(.top, 8)
                                        .padding(.horizontal)
                                    } //: LOOP
                                } //: HSTACK
                            } //: VSTACK
                        } //: LOOP
                        
                    } else {
                        
                        VStack(alignment: .center) {
                            Text("League Not Drafting")
                                .font(.headline)
                                .padding()
                        }
                        
                    } //: IF
                    
                } //: VSTACK
                
            })
            //.padding()
            .navigationBarTitle("Draft Board", displayMode: .inline)
            .toolbar {
                #if os(iOS)
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        isPresented = false
                    }, label: {
                        Image(systemName: "xmark")
                    })
                }
                #endif
            }
            .onAppear(perform: loadDraftBoardData)
            
        } //: NAV
        
    }
    
    
    //: MARK: - FUNCTIONS
    func loadDraftBoardData() {
        guard let url = URL(string: "https://www.fleaflicker.com/api/FetchLeagueDraftBoard?sport=NFL&league_id=\(leagueId)") else {
            print("Invalid URL")
            return
        }
        
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                do {
                    let decodedReponse = try JSONDecoder().decode(DraftResponse.self, from: data)
                    DispatchQueue.main.async {
                        self.draftOrder = decodedReponse.draftOrder
                        self.rows = decodedReponse.rows
                        self.isInProgress = decodedReponse.isInProgress ?? false
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

struct DraftBoardView_Previews: PreviewProvider {
    static var previews: some View {
        DraftBoardView(isPresented: .constant(true), leagueId: 207066)
        //DraftBoardView(isPresented: .constant(true), leagueId: 320927)
        //320927
    }
}
