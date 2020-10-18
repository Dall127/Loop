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

    
    var body: some View {
        //Query name from database
        GroupBox(label: Text("Problem 1")) {
            
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
    //These two submit functions will probably live inside ProblemView
    func submitFeelingGood(){
        incrementTransaction(fieldName: "feeling-good")
    }
    func submitFeelingBad(){
        incrementTransaction(fieldName: "feeling-bad")
    }
    
    func incrementTransaction(fieldName: String){
        let assignmentRef = db.collection("classes").document("MATH1220").collection("assignments").document("assign02")
        db.runTransaction({ (transaction, errorPointer) -> Any? in
            let sfDocument: DocumentSnapshot
            do {
                try sfDocument = transaction.getDocument(assignmentRef)
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
            transaction.updateData([fieldName: oldCount + 1], forDocument: assignmentRef)
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
        StudentProblemView()
    }
}
