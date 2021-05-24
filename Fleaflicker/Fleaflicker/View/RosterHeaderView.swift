//
//  RosterHeaderView.swift
//  Fleaflicker
//
//  Created by Stu Greenham on 10/05/2021.
//

import SwiftUI

struct RosterHeaderView: View {
    
    //: MARK: - PROPERTIES
    let groupName: String    
    
    //: MARK: - BODY
    var body: some View {
        
        Text(getGroupTitle(groupName: groupName))
            .font(.headline)
            .padding(.bottom, 4)

    }
}


struct RosterHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        RosterHeaderView(groupName: "START")
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
