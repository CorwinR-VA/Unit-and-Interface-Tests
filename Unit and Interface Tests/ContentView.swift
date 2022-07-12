//
//  ContentView.swift
//  Unit and Interface Tests
//
//  Created by Corwin Rainier on 7/4/22.
//

import SwiftUI

struct ContentView: View {
    let playData = PlayData()
    @State var filteredWord = "swift"
    @State var searchFieldWord = ""
    @State var isShowingAlert = false
    var wordList: [String] {
        if filteredWord.isEmpty {
            return playData.allWords
        } else {
            return playData.filteredWords
        }
    }
    
    var body: some View {
        ZStack {
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
                .navigationTitle("Testing Project")
                .toolbar {
                    Button {
                        isShowingAlert = true
                    } label: {
                        Image(systemName: "magnifyingglass")
                    }
                }
            }
            
            if isShowingAlert {
                Color.black.opacity(0.4).edgesIgnoringSafeArea(.all)
                
                VStack(spacing: 0) {
                    VStack {
                        Text("Filter...")
                            .bold()
                        TextField("Search word or number", text: $searchFieldWord)
                            .padding(.horizontal, 5)
                            .background(Color.white)
                            .border(.secondary, width: 1)
                    }
                    .padding()
                    Divider()
                    HStack {
                        Button {
                            searchFieldWord = ""
                            isShowingAlert = false
                        } label: {
                            Text("Cancel")
                                .bold()
                        }
                        .frame(maxWidth: .infinity)
                        Divider()
                        
                        Button {
                            playData.applyUserFilter(searchFieldWord)
                            filteredWord = searchFieldWord
                            isShowingAlert = false
                        } label: {
                            Text("Filter")
                        }
                        .frame(maxWidth: .infinity)
                    }
                    .frame(height: 45)
                }
                .background(.thickMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 15))
                .transition(.scale(scale: 2).combined(with: .opacity))
                .frame(maxWidth: 250)
            }
        }
        .animation(.easeIn(duration: 0.10), value: isShowingAlert)
    }
    
    init() {
        playData.applyUserFilter(filteredWord)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
