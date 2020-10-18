//
//  CreateClassView.swift
//  Loop
//
//  Created by Dallin Burton on 10/18/20.
//

import SwiftUI
import Firebase

struct CreateClassView: View {
	@Environment(\.presentationMode) var presentation
	@EnvironmentObject var session: SessionStore

	var existingClasses : Array<aClass>
	@State var randomID = ""
	@State var className = ""
	@State var showingAlert = false
	var db = Firestore.firestore()

	func randomString(length: Int) -> String {
		let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
		return String((0..<length).map{ _ in letters.randomElement()! })
	}
    var body: some View {
		VStack {
			Spacer()
			Text("Code:  " + randomID)
				.font(.title)
				.padding(.vertical, 10.0)



			GroupBox{
				Text("Enter the name of the  class you want to create")
					.font(.footnote)
				TextField("Class Name", text: $className).textContentType(.username).padding(.horizontal, 20.0).textFieldStyle(RoundedBorderTextFieldStyle()).foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
			}
			.padding(.horizontal, 15.0)
			Spacer()
			Button(action: {
			
				if(className == "") {
					showingAlert = true
				}
				else {
					
					db.collection("classes").document(randomID).setData([
						"name": className,
						"code": randomID,
						
					]) { err in
						if let err = err {
							print("Error writing document: \(err)")
						} else {
							print("Document successfully written!")
						}
					}
					db.collection("teachers").document(session.session!.uid).updateData([
						"classes" : FieldValue.arrayUnion([db.collection("classes").document(randomID)])
						
					]) { err in
						if let err = err {
							print("Error writing document: \(err)")
						} else {
							print("Document successfully written!")
						}
					}
					
					
					
					self.presentation.wrappedValue.dismiss()

				}
			},
			label: {
				HStack {
					Spacer()
					Text("Create")
						.fontWeight(.medium)
						.foregroundColor(.white)
					Image(systemName: "plus.square.fill").font(Font.title.weight(.medium)).foregroundColor(.white);
					Spacer()
				}
				
						
			}).padding(.horizontal, 15.0).buttonStyle(NeumorphicButtonStyle(bgColor: .systemBlue))
				
		}.navigationBarTitle(Text("Create Class"), displayMode: .inline).onAppear(perform: {
			self.randomID = randomString(length: 8)
		}).alert(isPresented: $showingAlert) { Alert(title: Text("Oops"), message: Text("A class with this name already exists, or was empty. Please Try Again"), dismissButton: .default(Text("Close")))}

		
		
	}
}

struct CreateClassView_Previews: PreviewProvider {
    static var previews: some View {
		CreateClassView(existingClasses: Array<aClass>())
    }
}
