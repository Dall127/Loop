//
//  ContentView.swift
//  Loop
//
//  Created by Dallin Burton on 10/16/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        BaseCard(title: "hello", cellHeight:150, cellWidth: 300) {
			Text("Hi, Welcome to your Calculus 2 Class!, This is where you will be able to give feedback to your professors")
		}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
