//
//  Models.swift
//  Loop
//
//  Created by Dallin Burton on 10/17/20.
//



import Foundation
import FirebaseFirestore

class StudentViewModel: ObservableObject {
	var UserID = ""
	var isStudent = false
	@Published var student = Student()
	private var db = Firestore.firestore()
	
	func fetchData() -> Void {
		db.collection("students").addSnapshotListener { (querySnapshot, error) in
			guard let documents = querySnapshot?.documents else {
				print("No documents") // the printing is done here
				return
			}
			for  queryDocumentSnapshot in documents {
				let data = queryDocumentSnapshot.data()
				let userID = data["UserID"] as? String ?? ""
				if(userID == self.UserID) {
					self.student.userID = userID
					let tempArray = data["Classes"] as? Array ?? []
					for i in tempArray {
						let docID = (i as? DocumentReference)?.documentID
						if(docID != nil) {
							self.student.classes.append(docID!)
							
						}
					}
					self.isStudent = true
					return
				}
				
				
			

			}
			
		}
	}
	func setUID(UserID: String) {
		self.UserID = UserID
	}
}
struct Student: Identifiable {
	var id = UUID()
	var userID = ""
	var classes = Array<String>()

}


class TeacherViewModel: ObservableObject {
	var UserID = ""
	var isTeacher = false
	@Published var teacher = Teacher()
	private var db = Firestore.firestore()
	
	func fetchData() -> Void {
		db.collection("teachers").addSnapshotListener { (querySnapshot, error) in
			guard let documents = querySnapshot?.documents else {
				print("No documents") // the printing is done here
				return
			}
			for  queryDocumentSnapshot in documents {
				let data = queryDocumentSnapshot.data()
				let userID = data["UserID"] as? String ?? ""

				if(userID == self.UserID) {
					self.teacher.userID = userID
					let tempArray = data["Classes"] as? Array ?? []
					for i in tempArray {
						let docID = (i as? DocumentReference)?.documentID
						if(docID != nil) {
							self.teacher.classes.append(docID!)
							
						}
					
					}
					self.isTeacher = true
					return
				}
				
				
				
			}
			
		}
	}
	func setUID(UserID: String) {
		self.UserID = UserID
	}
}
struct Teacher: Identifiable {
	var id = UUID()
	var userID = ""
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
