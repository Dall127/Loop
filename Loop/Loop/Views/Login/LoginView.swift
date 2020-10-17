//
//  Login.swift
//  Loop
//
//  Created by Dallin Burton on 10/16/20.
//

import SwiftUI

struct Login: View {
	var body: some View {
		VStack {
			Text("Logo")
				.foregroundColor(Color.blue)
			Spacer()
			TextField("Username", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
			Spacer()
			TextField("Password", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
			Spacer()
			HStack {
				Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
					HStack( content:
								{
									
									Text("Login")
										.fontWeight(.medium)
										.padding(.trailing, 20.0);
									Image(systemName: "arrowshape.turn.up.right.fill").padding(.leading, 20.0).font(Font.title.weight(.medium));
								})
						.padding(.leading, 10.0)
					
					
					
				}).buttonStyle(NeumorphicButtonStyle(bgColor: Color.neuBackground))
			}
			
			Spacer()
			
		}
	}
	
}

struct Login_Previews: PreviewProvider {
	static var previews: some View {
		Login()
	}
}
