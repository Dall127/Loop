//
//  ContentView.swift
//  Loop
//
//  Created by Dallin Burton on 10/16/20.
//

import SwiftUI
import Firebase
import Combine


	

struct ContentView: View {
	@EnvironmentObject var session: SessionStore
	
	var body: some View {
		if(session.session != nil) {
			ClassView().environmentObject(session)
		}
		else{
			LoginView().environmentObject(session)

		}

	
	}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
