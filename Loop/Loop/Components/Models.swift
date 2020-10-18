//
//  Models.swift
//  Loop
//
//  Created by Dallin Burton on 10/17/20.
//


import SwiftUI
import Foundation
import FirebaseFirestore
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
								self.teacher.classes.append(classData as! String)

								
							}
					}
				}
		})
	}
}
struct Teacher: Identifiable {
	var id = UUID()
	var classes = Array<String>()
	
}

//class Assignemnts: ObservableObject {
//	var problems = Array<String>()
//	var className = ""
//	private var db = Firestore.firestore()
//
//	func fetchData() -> Void {
//		db.collection("classes").collectionID("assignments").addSnapshotListener { (querySnapshot, error) in
//			guard let documents = querySnapshot?.documents else {
//				print("No documents") // the printing is done here
//				return
//			}
//			for  queryDocumentSnapshot in documents {
//				let data = queryDocumentSnapshot.data()
//				self.aClass.name = data["name"] as? String ?? ""
//				let assignmentsArray = data["problems"] as? Array ?? []
//				for i in assignmentsArray {
//					let docID = (i as? DocumentReference)?.documentID
//					if(docID != nil) {
//						self.aClass.problems.append(docID!)
//
//					}
//				}
//
//
//
//			}
//
//		}
//	}
//	func setClassName(className: String) {
//		self.className = className
//	}
//}
//
//struct Assignment: Identifiable {
//	var id = UUID()
//	var name = ""
//	var problems =  Array<String>()
//
//}
