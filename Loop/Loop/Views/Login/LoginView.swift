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

	@State var email: String = ""
	@State var password: String = ""
	
	@State var loading = false
	@State var error = false
	@State var errors : Array<String> = []
	@State var loggedIn = false
	
	
	
	var body: some View {
		NavigationView {
		

			
		VStack {
			Image("Logo")
			if(errors.count > 0) {
				ForEach(errors, id: \.self) {error in
					HStack {
						GroupBox {
							Text(error).foregroundColor(.white)
						}.padding(.horizontal, 10.0).groupBoxStyle(TransparentGroupBox())
					}
					.padding(.vertical, 10.0).padding(.top, 15)
					
					
				}
			}
			TextField("Email", text: $email).textContentType(.username).keyboardType(.emailAddress).padding([.top, .leading, .trailing], 20.0).textFieldStyle(RoundedBorderTextFieldStyle()).foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
			
			SecureField("Password", text: $password).textContentType(.password).padding([.leading, .bottom, .trailing], 20.0).textFieldStyle(RoundedBorderTextFieldStyle()).foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
			Spacer()
			HStack {
					Button(action: {}, label: {
						NavigationLink(destination: CreateUserView().environmentObject(SessionStore())) {

						HStack( content:
									{
											Text("Create Account")
												.fontWeight(.medium)
												.foregroundColor(.white)

												.padding(.trailing, -15.0);
										
										Image(systemName: "person.crop.circle.badge.plus").padding(.leading, 20.0).font(Font.title.weight(.medium)).foregroundColor(.white)
;
									})
						
						
						}
					}).buttonStyle(NeumorphicButtonStyle(bgColor: .systemBlue))
				
				Button(action: {

						loading = true
						error = false
						session.signIn(email: email, password: password) { (result, error) in
							self.loading = false
							if(error != nil){
								errors = []
								errors.append((error! as NSError).localizedDescription)
							}
							else {
								self.email = ""
								self.password = ""
								self.loggedIn = true
							}
						}

					
					},
					label: {

						HStack( content: {
							Text("Login")
								.fontWeight(.medium)
								.foregroundColor(.white)
								.padding(.trailing, 20.0);
							Image(systemName: "arrowshape.turn.up.right.fill").padding(.leading, 20.0).font(Font.title.weight(.medium)).foregroundColor(.white)

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
