//
//  ContentView.swift
//  Unit and Interface Tests
//
//  Created by Corwin Rainier on 7/4/22.
//

import SwiftUI

struct ContentView: View {
    let playData = PlayData()
    @State var searchWords = ""
    var wordList: [String] {
        if searchWords.isEmpty {
            return playData.allWords
        } else {
            playData.applyUserFilter(searchWords)
            return playData.filteredWords
        }
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(wordList, id: \.self) { word in
                    HStack {
                        Text(word)
                        Spacer()
                        Text("\(playData.wordCounts.count(for: word))")
                    }
                }
            }
            .searchable(text: $searchWords)
            .navigationTitle("Testing Project")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
