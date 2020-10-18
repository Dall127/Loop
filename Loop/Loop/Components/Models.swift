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
