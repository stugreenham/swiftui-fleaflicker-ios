//
//  DraftBoardCellView.swift
//  Fleaflicker
//
//  Created by Stu Greenham on 07/05/2021.
//

import SwiftUI

struct DraftBoardCellView: View {
    
    //: MARK: - PROPERTIES
    let slotOverallNo: Int
    let slowOwner: String
    let slotColor: String
    let playerName: String?
    let playerTeam: String?
    let playerPosition: String?
    let onTheClock: Bool
    
    var body: some View {
        
        VStack(alignment: .leading) {
            HStack(alignment: .top) {
                VStack(alignment: .leading) {
                    Text(onTheClock ? "On The Clock!" : playerName ?? "")
                        .font(.headline)
                }
                
                Spacer()
                
                if !onTheClock {
                    Text(String("\(playerPosition ?? "") - \(playerTeam ?? "")"))
                        .font(.footnote)
                        .padding(.top, 2)
                } else {
                    Image(systemName: "stopwatch")
                        .font(.footnote)
                        .padding(.top, 2)
                }
            }
            
            //Spacer()
            
            HStack {
                Text(slowOwner)
                    .font(.footnote)
                
                Spacer()
                
                Text(String(slotOverallNo))
                    .font(.footnote)
                
                if onTheClock {
                    Image(systemName: "stopwatch")
                        .font(.footnote)
                }
            }
            .padding(.top, 2)
            
        } //: VSTACK
        //.frame(height: 50, alignment: .leading)
        .padding(10)
        .background(
            onTheClock ? Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.8470588235)) : getColor(kind: slotColor)
        )
        .foregroundColor(.white)
        .clipShape(RoundedRectangle(cornerRadius: 8))
        
    }
}

struct DraftBoardCellView_Previews: PreviewProvider {
    static var previews: some View {
        DraftBoardCellView(slotOverallNo: 21, slowOwner: "Soldier Fields", slotColor: "default", playerName: "Trevor Lawrence", playerTeam: "JAX", playerPosition: "QB", onTheClock: false)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
