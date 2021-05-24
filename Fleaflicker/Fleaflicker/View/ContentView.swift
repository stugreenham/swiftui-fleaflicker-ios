//
//  ContentView.swift
//  Fleaflicker
//
//  Created by Stu Greenham on 29/04/2021.
//

import SwiftUI


struct ContentView: View {
        
    //: MARK: - BODY
    var body: some View {
        
        TabView {
            
            LeagueView()
                .tabItem {
                    Image(systemName: "list.star")
                    Text("Leagues")
                }
            
            ScoreView()
                .tabItem {
                    Image(systemName: "gamecontroller")
                    Text("Scores")
                }
            
//            DraftBoardView()
//                .tabItem {
//                    Image(systemName: "bolt.circle")
//                    Text("Draft Board")
//                }
//
//            SettingsView()
//                .tabItem {
//                    Image(systemName: "gearshape.fill")
//                    Text("Settings")
//                }
            
        } //: TAB
        
        
                    
    }
    
}


//: MARK: - PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
