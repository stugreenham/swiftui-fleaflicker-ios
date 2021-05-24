//
//  MovieRow.swift
//  Fleaflicker
//
//  Created by Stu Greenham on 05/05/2021.
//

import SwiftUI

struct MovieRow : View {
    var movie: Movie
    
    var body: some View {
        HStack {
            
            
            VStack {
                Spacer()
                HStack {
                    Text(movie.title)
                        .foregroundColor(.blue)
                        .lineLimit(nil)
                    Spacer()
                }
                HStack {
                    Text(movie.release_date).foregroundColor(.gray)
                    Spacer()
//                    Text("Rate: \(movie.vote_average.format())")
                }
                HStack {
                    Text("Vote count: \(movie.vote_count)")
                        .foregroundColor(.gray)
                        .lineLimit(nil)
                    Spacer()
                }
                HStack {
                    Text("Popularity: \(movie.popularity)")
                        .foregroundColor(.gray)
                        .lineLimit(nil)
                    Spacer()
                }
                Spacer()
            }
        }.frame(height: 130)
    }
}
