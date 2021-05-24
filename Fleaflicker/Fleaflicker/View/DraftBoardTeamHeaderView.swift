//
//  DraftBoardTeamHeaderView.swift
//  Fleaflicker
//
//  Created by Stu Greenham on 07/05/2021.
//

import SwiftUI

struct DraftBoardTeamHeaderView: View {
    
    let teamName: String
    
    var body: some View {
        Text(teamName)
            .frame(width: 200, height: 40, alignment: .center)
            .background(Color(.systemGray2))
            .foregroundColor(.white)
            .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}

struct DraftBoardTeamHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        DraftBoardTeamHeaderView(teamName: "Soldier Fields")
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
