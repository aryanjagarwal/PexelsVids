//
//  ContentView.swift
//  PexelsVids
//
//  Created by Aryan Jagarwal on 26/02/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var videoManager = VideoManager()
    var columns = [GridItem(.adaptive(minimum: 160), spacing: 20)]
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    ForEach(Query.allCases, id: \.self) { SearchQuery in
                        QueryTag(query: SearchQuery, isSelected: videoManager.selectedQuery == SearchQuery).onTapGesture {
                            videoManager.selectedQuery = SearchQuery
                        }
                    }
            }
            
            ScrollView {
                if videoManager.videos.isEmpty {
                    ProgressView()
                } else {
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(videoManager.videos, id: \.id) { video
                            in
                            NavigationLink {
                                VideoView(video: video)
                            } label: {
                                VideoCard(video: video)
                            }
                        }
                    }
                    .padding()
                }
            }
            .frame(maxWidth: .infinity)
        }
        .background(Color("AccentColor"))
        .navigationBarHidden(true)
    }
  }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
