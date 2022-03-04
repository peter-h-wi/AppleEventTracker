//
//  ContentView.swift
//  AppleEventTracker WatchKit Extension
//
//  Created by peter wi on 3/4/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var vm = UpdateViewModel()
    var body: some View {
        ZStack {
            if vm.timePassed {
                VStack {
                    Text("Event is happening!")
                        .font(.caption)
                    Image("qrcode")
                        .resizable()
                        .scaledToFit()
                }
            } else {
                TimelineView(.periodic(from: .now, by: 1.0)) { timeline in
                    VStack {
                        Text(vm.getTimeInterval())
                            .font(.largeTitle)
                            .italic()
                    }
                }
                .zIndex(1)
                
                VStack {
                    Image("apple-event-march-8")
                        .resizable()
                        .scaledToFit()
                    Text("Peek performance.")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
