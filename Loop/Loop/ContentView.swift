//
//  ContentView.swift
//  Loop
//
//  Created by Dallin Burton on 10/16/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        BaseCard(Title: "hello", BodyLabel: "world")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
