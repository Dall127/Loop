//
//  Login.swift
//  Loop
//
//  Created by Dallin Burton on 10/16/20.
//

import SwiftUI
struct LoginView: View {
	@Environment(\.colorScheme) var colorScheme
	@State private var action: Int? = 0
	@EnvironmentObject var session: SessionStore

	var body: some View {
		NavigationView() {

			VStack {
				Image("Logo")
				Spacer()
				TextField("Username", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/).padding(.all, 20.0).textFieldStyle(RoundedBorderTextFieldStyle()).foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
				
				TextField("Password", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/).padding(.all, 20.0).textFieldStyle(RoundedBorderTextFieldStyle()).foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
				Spacer()
				HStack {
						Button(action: {}, label: {
							NavigationLink(destination: CreateUserView().environmentObject(SessionStore())) {

							HStack( content:
										{
												Text("Create User")
													.fontWeight(.medium)
													.foregroundColor(.white)

													.padding(.trailing, -15.0);
											
											Image(systemName: "person.crop.circle.badge.plus").padding(.leading, 20.0).font(Font.title.weight(.medium)).foregroundColor(.white)
;
										})
							
							
							}
						}).buttonStyle(NeumorphicButtonStyle(bgColor: .systemBlue))
					
					Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
						
						
						
						
						HStack( content:
									{
										
										Text("Login")
											.fontWeight(.medium)
											.foregroundColor(.white)
											.padding(.trailing, 20.0);
										Image(systemName: "arrowshape.turn.up.right.fill").padding(.leading, 20.0).font(Font.title.weight(.medium)).foregroundColor(.white)
;
									})
						
						
						
						
					}).buttonStyle(NeumorphicButtonStyle(bgColor: .systemBlue))
					
				}
				
				
				
				
				Spacer()
				
			}

		}
	}
}
	


struct LoginView_Previews: PreviewProvider {
	static var previews: some View {
		LoginView()
	}
}
