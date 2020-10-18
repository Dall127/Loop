//
//  StudentProblemView.swift
//  Loop
//
//  Created by Guillermo Ramos  on 10/17/20.
//

import SwiftUI
import Firebase
import FirebaseCore
import FirebaseFirestore
import FirebaseFirestoreSwift


struct ProblemView: View {
    @State var teacher = Teacher()
    @State var isTeacher : Bool = false
    @State var student = Student()
    @State var isStudent: Bool = false
    @EnvironmentObject var session: SessionStore
    
    let db = Firestore.firestore()
    let documentPath: String
    let problemName: String
    
    init(problemName: String, documentPath : String) {
        self.documentPath = documentPath
        self.problemName = problemName
    }
    
    
    var body: some View {
        TeacherViewModel(isTeacher: $isTeacher, teacher: $teacher)
        StudentViewModel(isStudent: $isStudent, student: $student)
        
        //Query name from database
        GroupBox(label: Text(problemName)) {
            
            //Replace with a StudentPollView
            HStack{
                Button(action: submitFeelingGood) {
                    Text("😃")
                }
                Button(action: submitFeelingBad) {
                    Text("🙁")
                }
            }
        }
    }
    
    func submitFeelingGood(){
        incrementTransaction(fieldName: "feeling-good")
    }
    func submitFeelingBad(){
        incrementTransaction(fieldName: "feeling-bad")
    }
    
    func incrementTransaction(fieldName: String){
        let problemRef = db.document(documentPath)
        db.runTransaction({ (transaction, errorPointer) -> Any? in
            let sfDocument: DocumentSnapshot
            do {
                try sfDocument = transaction.getDocument(problemRef)
            } catch let fetchError as NSError {
                errorPointer?.pointee = fetchError
                return nil
            }

            guard let oldCount = sfDocument.data()?[fieldName] as? Int else {
                let error = NSError(
                    domain: "AppErrorDomain",
                    code: -1,
                    userInfo: [
                        NSLocalizedDescriptionKey: "Unable to retrieve population from snapshot \(sfDocument)"
                    ]
                )
                errorPointer?.pointee = error
                return nil
            }

            // Note: this could be done without a transaction
            //       by updating the count using FieldValue.increment()
            transaction.updateData([fieldName: oldCount + 1], forDocument: problemRef)
            return nil
        }) { (object, error) in
            if let error = error {
                print("Transaction failed: \(error)")
            } else {
                print("Transaction successfully committed!")
            }
        }

    }

}

struct StudentProblemView_Previews: PreviewProvider {
    static var previews: some View {
        ProblemView(problemName: "Problem 1", documentPath: "classes/MATH1220/assignments/assign02/problems/problem1")
    }
}
