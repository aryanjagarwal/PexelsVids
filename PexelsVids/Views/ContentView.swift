//
//  ContentView.swift
//  PexelsVids
//
//  Created by Aryan Jagarwal on 26/02/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            HStack {
                ForEach(Query.allCases, id: \.self) {
                    SearchQuery in
                    QueryTag(query: SearchQuery, isSelected: false)
                }
            }
            
            ScrollView {
                VideoCard(video: previewVideo)
            }
            .frame(maxWidth: .infinity)
        }
        .background(Color("AccentColor"))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
