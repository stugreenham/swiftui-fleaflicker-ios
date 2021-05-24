//
//  DraftBoardRoundHeaderView.swift
//  Fleaflicker
//
//  Created by Stu Greenham on 10/05/2021.
//

import SwiftUI

struct DraftBoardRoundHeaderView: View {
    let roundNo: Int
    
    var body: some View {
        
        HStack {
            Text("Round \(roundNo)")
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(.gray)
            Spacer()
        }
        //.frame(width: 200, height: 40, alignment: .center)
        //.padding(8)
        //.padding(.horizontal)
        //.background(Color(.systemGray2))
        //.foregroundColor(.white)
        .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}

struct DraftBoardRoundHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        DraftBoardRoundHeaderView(roundNo: 1)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
