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


struct StudentProblemView: View {
    //Setup
    let db = Firestore.firestore()
    let problemName: String
    let documentPath: String
    
    init(problemName : String, documentPath : String) {
        self.problemName = problemName
        self.documentPath = documentPath
    }
    
    var body: some View {
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
        StudentProblemView(problemName: "Problem 1", documentPath: "classes/MATH1220/assignments/assign02/problems/problem1")
    }
}
