//
//  Models.swift
//  Loop
//
//  Created by Dallin Burton on 10/17/20.
//


import SwiftUI
import Foundation
import Firebase
import SwiftUI
struct StudentViewModel: View {
	@EnvironmentObject var session: SessionStore
	@Binding var isStudent : Bool
	@Binding var student : Student
	let db = Firestore.firestore()

	var body: some View {
		Spacer().onAppear(perform: {
			db.collection("students").document(session.session!.uid)
				.addSnapshotListener { documentSnapshot, error in
					guard let document = documentSnapshot else {
						print("Error fetching document: \(error!)")
						return
					}
					guard let data = document.data() else {
						print("Document data was empty.")
						return
					}
					self.isStudent = true
					self.student.classes = []
					let tempArray = data["classes"] as? Array ?? []
					for i in tempArray {
						let docID = (i as? DocumentReference)?.documentID
						db.collection("classes").document(docID!)
							.addSnapshotListener { documentSnapshot, error in
								guard let document = documentSnapshot else {
									print("Error fetching document: \(error!)")
									return
								}
								guard let data = document.data() else {
									print("Document data was empty.")
									return
								}
								let classData = data["name"]
								self.student.classes.append(classData as! String)
								
								
							}
					}
				}
		})
	}
}

								

	
//self.student.classes.append(docID!)

	
	
struct Student: Identifiable {
	var id = UUID()
	var classes = Array<String>()
	
}


struct TeacherViewModel: View {
	@EnvironmentObject var session: SessionStore
	@Binding var isTeacher : Bool
	@Binding var teacher : Teacher
	@State var classes = Array<String>()
	let db = Firestore.firestore()
	
	var body: some View {
		Spacer().onAppear(perform: {
			db.collection("teachers").document(session.session!.uid)
				.addSnapshotListener { documentSnapshot, error in
					guard let document = documentSnapshot else {
						print("Error fetching document: \(error!)")
						return
					}
					guard let data = document.data() else {
						print("Document data was empty.")
						return
					}
					self.isTeacher = true
					self.teacher.classes = []
					let tempArray = data["classes"] as? Array ?? []
					for i in tempArray {
						let docID = (i as? DocumentReference)?.documentID
						db.collection("classes").document(docID!)
							.addSnapshotListener { documentSnapshot, error in
								guard let document = documentSnapshot else {
									print("Error fetching document: \(error!)")
									return
								}
								guard let data = document.data() else {
									print("Document data was empty.")
									return
								}
								let classData = data["name"]
								self.teacher.classes.append(aClass(className: classData as! String, classCode: docID!))

								
							}
					}
				}
		})
	}
}

struct Teacher: Identifiable {
	var id = UUID()
	var classes = Array<aClass>()
	
}

struct aClass: Identifiable, Hashable {
	var id = UUID()
	var className  : String
	var classCode  : String
}


struct Assignemnts:  View {
	var aClass : aClass
	
	let db = Firestore.firestore()
	
	@State var assignments = Array<aAssignment>()
	var body: some View {
		Spacer().onAppear(perform: {
			
			db.collection("classes").document(aClass.classCode).collection("assignments")
				.getDocuments() { (querySnapshot, err) in
					if let err = err {
						print("Error getting documents: \(err)")
					} else {
						for document in querySnapshot!.documents {
							assignments.append(aAssignment.init(id: UUID.init(), name: document["name"] as! String, classID: document, aClass: aClass))
						}
					}
				}
		})
	}
}

struct Assignment: Identifiable {
	var id = UUID()
	var name = ""
	var classID : Any
	var aClassHolder = aClass(className: "", classCode: "")
	var assignments = Array<aAssignment>()

}
struct aAssignment: Identifiable {
	var id = UUID()
	var name : String
	var classID : Any
	var aClass : aClass
	
	
}



struct Problems:  View {
	@EnvironmentObject var session: SessionStore
	@Binding var aAssignment : aAssignment
	let db = Firestore.firestore()
	
	var body: some View {
		Spacer().onAppear(perform: {
	
			db.collection("classes").document(aAssignment.aClass.classCode).collection("assignments").document((aAssignment.classID as? String ?? "")).collection("problems")
				.getDocuments() { (querySnapshot, err) in
					if let err = err {
						print("Error getting documents: \(err)")
					} else {
						for document in querySnapshot!.documents {
							print(document)
						}
					}
				}
		})
	}
}

struct Problem: Identifiable {
	var id = UUID()
	var name = ""
	var aAssignmentHolder = aAssignment(id: UUID.init(), name: "", classID: (Any).self, aClass: aClass(className: "", classCode: ""))
	var positive = 0
	var negative = 0
}
