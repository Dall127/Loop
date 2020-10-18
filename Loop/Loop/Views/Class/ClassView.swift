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
	@ObservedObject var student = StudentViewModel()
	@ObservedObject var teacher = TeacherViewModel()

	@State var finishedRegistering = false
    var body: some View {
		
		VStack {
			EmptyView()
			if (student.student.classes.count > 0) {
				ForEach(student.student.classes, id: \.self) {aClass in
					Text(aClass)
				}
	
			}
			else if (teacher.teacher.classes.count > 0) {
				ForEach(teacher.teacher.classes, id: \.self) {aClass in
					Text(aClass)
				}
				
			}
			else {
				Text("Hi")
			}
			
		}.onAppear() {
			self.student.setUID(UserID: session.session!.uid)
			self.teacher.setUID(UserID: session.session!.uid)

			self.student.fetchData()
			self.teacher.fetchData()
			
			
		}


	}
}

struct ClassView_Previews: PreviewProvider {
    static var previews: some View {
        ClassView()
	}
}
