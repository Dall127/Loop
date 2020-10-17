//
//  CreateUserView.swift
//  Loop
//
//  Created by Dallin Burton on 10/17/20.
//

import SwiftUI
import FirebaseAuth
struct CreateUserView: View {
	@State private var userType = 0
	@State private var errors : Array<Any>?
	init() {
		UITableView.appearance().tableHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: Double.leastNonzeroMagnitude))
	}

    var body: some View {
		NavigationView () {
			VStack {
				Form {

					Section {
						Text("Pick User Type")
						HStack {
							Picker(selection: $userType, label: Text("What is your favorite color?")) {
								Text("Teacher").tag(0)
								Text("Student").tag(1)
							}.pickerStyle(SegmentedPickerStyle())
						}
					}
					
					
					
					
					Section {
						Text("Choose a Username")
						TextField("Username", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/).padding().textFieldStyle(RoundedBorderTextFieldStyle())
					}
					
					Section {
						HStack {
							Text("Choose A Password")
								.multilineTextAlignment(.leading)
						}
						TextField("Password", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/).padding(.horizontal, 20.0).textFieldStyle(RoundedBorderTextFieldStyle())
						TextField("Confirm Password", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/).padding([.leading, .bottom, .trailing], 20.0).textFieldStyle(RoundedBorderTextFieldStyle())
					}
				}.foregroundColor(.systemBlue)


				Spacer()
				Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
			
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
				Spacer()
				
				
			}


				
			


		}.navigationBarTitle(Text("Create User"), displayMode: .inline)

		
    }
}

struct CreateUserView_Previews: PreviewProvider {
    static var previews: some View {
        CreateUserView()
    }
}
