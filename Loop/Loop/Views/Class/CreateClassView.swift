//
//  CreateClassView.swift
//  Loop
//
//  Created by Dallin Burton on 10/18/20.
//

import SwiftUI
import Firebase
struct CreateClassView: View {
	@EnvironmentObject var session: SessionStore
	@Environment(\.presentationMode) var presentation

	let db = Firestore.firestore()

	@State var randomID = ""
	@State var name = ""
	func randomString(length: Int) -> String {
		let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
		return String((0..<length).map{ _ in letters.randomElement()! })
	}
    var body: some View {
		VStack{
			Group {
				Text("Class Code: " + randomID)
				TextField("Email", text: $name).textContentType(.username).textFieldStyle(RoundedBorderTextFieldStyle())
			}
			Spacer()
			Button(action: {
				db.collection("classes").document(randomID).setData([
					"name": name,
				]) { err in
					if let err = err {
						print("Error updating document: \(err)")
					} else {
						print("Document successfully updated")
					}
				}
				
				
				db.collection("teachers").document(session.session!.uid).updateData([
					"classes":	FieldValue.arrayUnion([db.collection("classes").document(randomID)])
				]) { err in
					if let err = err {
						print("Error updating document: \(err)")
					} else {
						print("Document successfully updated")
					}
				}
				self.presentation.wrappedValue.dismiss()

				
				
			},
			
			label: {
				
				HStack( content: {
					Spacer()

					Text("Create")
						.fontWeight(.medium)
						.foregroundColor(.white)
						.padding(.trailing, 20.0);
					Image(systemName: "plus.square.fill").padding(.leading, 20.0).font(Font.title.weight(.medium)).foregroundColor(.white)
					Spacer()
					
				})
				
			}).buttonStyle(NeumorphicButtonStyle(bgColor: .systemBlue))
			
		}.onAppear(perform: {
			randomID = randomString(length: 8)
		})
    }
}

struct CreateClassView_Previews: PreviewProvider {
    static var previews: some View {
		CreateClassView()
    }
}
