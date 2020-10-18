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

    var body: some View {
		
		VStack {
			EmptyView()
			if (student.student.classes.count > 0) {
				ForEach(student.student.classes, id: \.self) {aClass in
					Text(aClass)
//					Put link here to the class, and	You're going to want to create an observed object you can pass to the assignments view
				}

			}
			else if (teacher.teacher.classes.count > 0) {
				ForEach(teacher.teacher.classes, id: \.self) {aClass in
					Text(aClass)
					//					Put link here to the class, and	You're going to want to pass in random generated code

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






struct ClassView_Previews: PreviewProvider {
    static var previews: some View {
        ClassView()
	}
}
