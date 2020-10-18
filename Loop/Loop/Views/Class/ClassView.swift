//
//  ClassView.swift
//  
//
//  Created by Dallin Burton on 10/17/20.
//

import SwiftUI
import Firebase



struct ClassView: View {

	@State var teacher = Teacher()
	@State var isTeacher : Bool = false
    @State var student = Student()
    @State var isStudent : Bool = false
	@EnvironmentObject var session: SessionStore
	var db = Firestore.firestore()


    var body: some View {
		TeacherViewModel(isTeacher: $isTeacher, teacher: $teacher)
        StudentViewModel(isStudent: $isStudent, student: $student)
        
        NavigationView{
			VStack {

				if(self.isTeacher) {
					Button(action: {},
						   label: {
							NavigationLink(destination: CreateClassView(existingClasses: self.teacher.classes).environmentObject(session)) {
								HStack( content:
											{
												Spacer()
												Text("Create Class")
													.fontWeight(.medium)
													.foregroundColor(.white)
												
												Image(systemName: "plus.square.fill").font(Font.title.weight(.medium)).foregroundColor(.white);
												Spacer()
											})
								
								
							}.padding(.horizontal, 15.0).buttonStyle(NeumorphicButtonStyle(bgColor: .systemBlue))
							
							
						   })
					List {
						ForEach(self.teacher.classes, id: \.self) {aClass in
							NavigationLink(
								destination: AssignmentsView(aAssignmentHolder: aAssignment(name: "", classID: Any.self, aClass: aClass)),
								label: {
									AssignmentCard(aClass: aClass, cellHeight: 200, cellWidth: 300)
									{
										Text("hehe")
									}
									.padding(.vertical, 20.0)
								})
							
							//					Put link here to the class, and	You're going to want to pass in random generated code

						}
					}

				}
                
                if(self.isStudent) {
                    Button(action: {},
                           label: {
                            NavigationLink(destination: AddClassView(existingClasses: self.student.classes).environmentObject(session)) {
                                HStack( content:
                                            {
                                                Spacer()
                                                Text("Add Class")
                                                    .fontWeight(.medium)
                                                    .foregroundColor(.white)
                                                
                                                Image(systemName: "plus.square.fill").font(Font.title.weight(.medium)).foregroundColor(.white);
                                                Spacer()
                                            })
                                
                                
                            }.padding(.horizontal, 15.0).buttonStyle(NeumorphicButtonStyle(bgColor: .systemBlue))
                            
                            
                           })
                    List {
                        ForEach(self.student.classes, id: \.self) {aClass in
                            //BaseCard(title: aClass, cellHeight: 200, cellWidth: 300)
                            ClassCard(className: aClass, classCode: "hehe")
                            //{
                             //   Text("hehe")
                           // }
                            .padding(.vertical, 20.0)

                            //                    Put link here to the class, and    You're going to want to pass in random generated code

                        }
                    }

                }

				else {
					Text("Are you a Student or a Teacher?")
					Button(action: {
						db.collection("teachers").document(session.session!.uid).setData([
							"classes" : [ ]
							
						]) { err in
							if let err = err {
								print("Error writing document: \(err)")
							} else {
								print("Document successfully written!")
							}
						}
					},
					label: {
						VStack {
							Spacer()
							HStack  {
								Spacer()
								VStack() {
									Text("Teacher")
										.font(.largeTitle)
										.fontWeight(.medium)
										.foregroundColor(.white)
									Image(systemName: "person.fill").padding(.top, 10.0).font(Font.title.weight(.medium)).foregroundColor(.white)
								}
								
								Spacer()
							}
							Spacer()
						}
						
					}
					).padding(.horizontal, 15.0).buttonStyle(NeumorphicButtonStyle(bgColor: .systemBlue))
					Button(action: {
						db.collection("students").document(session.session!.uid).setData([
							"classes" : [ ]
							
						]) { err in
							if let err = err {
								print("Error writing document: \(err)")
							} else {
								print("Document successfully written!")
							}
						}
					},
					label: {
						VStack {
							Spacer()
							HStack  {
								Spacer()
								VStack() {
									Text("Student")
										.font(.largeTitle)
										.fontWeight(.medium)
										.foregroundColor(.white)
									Image(systemName: "person.3.fill").padding(.top, 10.0).font(Font.title.weight(.medium)).foregroundColor(.white)
								}
								
								Spacer()
							}
							Spacer()
						}
						
					}
					).padding(.horizontal, 15.0).buttonStyle(NeumorphicButtonStyle(bgColor: .systemBlue))
					
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
