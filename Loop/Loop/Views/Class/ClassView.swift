//
//  ClassView.swift
//  
//
//  Created by Dallin Burton on 10/17/20.
//

import SwiftUI

struct ClassView: View {
	@EnvironmentObject var session: SessionStore

    var body: some View {
		Text("hi,i'm carl")
	}
}

struct ClassView_Previews: PreviewProvider {
    static var previews: some View {
        ClassView()
	}
}
