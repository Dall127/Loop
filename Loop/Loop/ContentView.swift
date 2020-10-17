//
//  ContentView.swift
//  Loop
//
//  Created by Dallin Burton on 10/16/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
		BaseCard(title: "hello") {
			Text("Hi")
		}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
