//
//  Function.swift
//  Fleaflicker
//
//  Created by Stu Greenham on 10/05/2021.
//

import SwiftUI


//: MARK: - DRAFT CELL COLOR

func getColor(kind: String) -> Color {
    var kindColor: Color
    
    // DRAFT_BOARD_EMPTY, DRAFT_BOARD_GREEN, DRAFT_BOARD_BLUE, DRAFT_BOARD_YELLOW, DRAFT_BOARD_RED, DRAFT_BOARD_GRAY, DRAFT_BOARD_PURPLE
    
    if (kind == "DRAFT_BOARD_GREEN") {
        kindColor = Color(#colorLiteral(red: 0.05882352941, green: 0.8, blue: 0.7137254902, alpha: 1)) // RB
    } else if(kind == "DRAFT_BOARD_BLUE") {
        kindColor = Color(#colorLiteral(red: 0.01176470588, green: 0.662745098, blue: 0.9568627451, alpha: 1)) // WR
    } else if(kind == "DRAFT_BOARD_YELLOW") {
        kindColor = Color(#colorLiteral(red: 1, green: 0.6784313725, blue: 0.3411764706, alpha: 1)) // TE
    } else if(kind == "DRAFT_BOARD_RED") {
        kindColor = Color(#colorLiteral(red: 0.9764705882, green: 0.1568627451, blue: 0.4156862745, alpha: 1))
    } else if(kind == "DRAFT_BOARD_GRAY") {
        kindColor = Color(#colorLiteral(red: 0.3960784314, green: 0.4078431373, blue: 0.4235294118, alpha: 1))
    } else if(kind == "DRAFT_BOARD_PURPLE") {
        kindColor = Color(#colorLiteral(red: 0.7333333333, green: 0.3960784314, blue: 0.9960784314, alpha: 1))
    } else if(kind == "DRAFT_BOARD_EMPTY") {
        kindColor = Color(#colorLiteral(red: 0.8771921992, green: 0.8771921992, blue: 0.8771921992, alpha: 1))
    } else {
        kindColor = Color(#colorLiteral(red: 0.6705882353, green: 0.7647058824, blue: 0.8078431373, alpha: 1))
    }
    return kindColor
}


//: MARK: - FORMAT ROSTER TITLES

func getGroupTitle(groupName: String) -> String {
    var groupTitle: String
    if groupName == "START" {
        groupTitle = "Starters"
    } else if groupName == "TAXI" {
        groupTitle = "Taxi"
    } else {
        groupTitle = "Bench"
    }
    return groupTitle
}
