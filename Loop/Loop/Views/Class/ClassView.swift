//
//  ClassView.swift
//  
//
//  Created by Dallin Burton on 10/17/20.
//

import SwiftUI
import Firebase



struct ClassView: View {
	@EnvironmentObject var session: SessionStore
	let db = Firestore.firestore()

	@State var teacher = Teacher()
	@State var student = Student()

	@State var isTeacher = false
	@State var isStudent = false

    var body: some View {
//		TeacherViewModel()
//		StudentViewModel()
		NavigationView {
			VStack {
				TeacherViewModel(isTeacher: $isTeacher, teacher: $teacher)

				if(self.isTeacher) {
					Button(action: {},
					
					label: {
						NavigationLink(destination: CreateClassView().environmentObject(session)) {
							HStack {
								Spacer()
								Text("Create Class")
									.fontWeight(.medium)
									.foregroundColor(.white)
									.padding(.trailing, 20.0);
								Image(systemName: "plus.square.fill").padding(.leading, 20.0).font(Font.title.weight(.medium)).foregroundColor(.white)
								Spacer()
							}
						}
							
						
						
					}).buttonStyle(NeumorphicButtonStyle(bgColor: .systemBlue)).padding(.horizontal, 20)
					ForEach(self.teacher.classes, id: \.self){aClass in
						Text(aClass)
					}
				}
				else if(self.isStudent) {
					EmptyView()
				}
				else {
					Group {
						Text("Pick User Type")
						Button(action: {
							db.collection("teachers").document(session.session!.uid).setData([
								"classes": [],
								
							]) { err in
								if let err = err {
									print("Error writing document: \(err)")
								} else {
									print("Document successfully written!")
								}
								self.isTeacher = true
							}
							
						},
						
						label: {
							
							HStack( content: {
								Text("Teacher")
									.fontWeight(.medium)
									.foregroundColor(.white)
									.padding(.trailing, 20.0);
								Image(systemName: "person.fill").padding(.leading, 20.0).font(Font.title.weight(.medium)).foregroundColor(.white)
								
							})
							
						}).buttonStyle(NeumorphicButtonStyle(bgColor: .systemBlue))
						Button(action: {
							db.collection("students").document(session.session!.uid).setData([
								"classes": [],
								
							]) { err in
								if let err = err {
									print("Error writing document: \(err)")
								} else {
									print("Document successfully written!")
								}
								self.isStudent = true
							}
							
						},
						
						label: {
							
							HStack( content: {
								Text("Students")
									.fontWeight(.medium)
									.foregroundColor(.white)
									.padding(.trailing, 20.0);
								Image(systemName: "person.3.fill").padding(.leading, 20.0).font(Font.title.weight(.medium)).foregroundColor(.white)
								
							})
							
						}).buttonStyle(NeumorphicButtonStyle(bgColor: .systemBlue))
					}
					
				}
			}
			
		}
	}
}






struct ClassView_Previews: PreviewProvider {
    static var previews: some View {
        ClassView()
	}
}
