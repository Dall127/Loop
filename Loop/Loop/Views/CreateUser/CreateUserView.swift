//
//  CreateUserView.swift
//  Loop
//
//  Created by Dallin Burton on 10/17/20.
//

import SwiftUI
import Foundation
import FirebaseAuth
struct CreateUserView: View {
	@Environment(\.colorScheme) var colorScheme
//	@State private var action: Int? = 0
	@EnvironmentObject var session: SessionStore
	@State private var showingAlert = false

	@State var username: String = ""

	@State var email: String = ""
	@State var password: String = ""
	@State var confirmPassword: String = ""

	@State var loading = false
	@State var error = false
	@State var errors : Array<String> = []
	@State var success = false


	
	
    var body: some View {
		NavigationLink(destination: ClassView().environmentObject(session), isActive: $success) {
			EmptyView()
		}
		VStack {
			

			
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
				
				
				GroupBox {
					Text("Enter your email")
					TextField("Email", text: $email).textContentType(.username).keyboardType(.emailAddress).textFieldStyle(RoundedBorderTextFieldStyle())
				}
				.padding(.vertical, 10.0).padding(.horizontal, 5)
				
				
				GroupBox {
					HStack {
						Text("Choose A Password")
							.multilineTextAlignment(.leading)
					}
					SecureField("Password", text: $password).textContentType(.newPassword).textFieldStyle(RoundedBorderTextFieldStyle())
					SecureField("Confirm Password", text: $confirmPassword).textContentType(.newPassword).textFieldStyle(RoundedBorderTextFieldStyle())
				}
				.padding(.vertical, 10.0).padding(.horizontal, 5)
				
				
				Button(action: {
					if(confirmPassword != password) {
						showingAlert = true
					}
					else {
						self.loading = true
						self.error = false
						session.signUp(email: email, password: password) { (result, error) in
							self.loading = false
							if(error != nil){
								errors = []
								errors.append((error! as NSError).localizedDescription)
							}
							else {
								self.email = ""
								self.password = ""
								self.confirmPassword = ""
								self.success = true
								
							}
						}
						
					}
					
				}, label: {
					HStack( content:
								{
									Spacer()
									Text("Create Account")
										.fontWeight(.medium)
										.foregroundColor(.white)
									
									Image(systemName: "plus.square.fill").font(Font.title.weight(.medium)).foregroundColor(.white);
									Spacer()
								})
					
					
					
					
					
				}).padding(.horizontal, 15.0).buttonStyle(NeumorphicButtonStyle(bgColor: .systemBlue))
				

	
			

		}.alert(isPresented: $showingAlert) {
			Alert(title: Text("Oops"), message: Text("The two passwords do not match. Please try again."), dismissButton: .default(Text("Close")))
		}.navigationBarTitle(Text("Create User"), displayMode: .inline)

		
	}
}

struct CreateUserView_Previews: PreviewProvider {
    static var previews: some View {
        CreateUserView()
    }
}
