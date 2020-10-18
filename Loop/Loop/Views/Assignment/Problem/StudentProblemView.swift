//
//  StudentProblemView.swift
//  Loop
//
//  Created by Guillermo Ramos  on 10/17/20.
//

import SwiftUI
import FirebaseCore
import FirebaseFirestore
import FirebaseFirestoreSwift

struct StudentProblemView: View {
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
        db.collection("classes").document("MATH1220").collection("assignments").document("assign02").setData([
            //1 is a placeholder - we want to add 1 to the current number stored.
            "feeling-good" : 1
            
        ], merge: true)
    }
    func submitFeelingBad(){
        db.collection("classes").document("MATH1220").collection("assignments").document("assign02").setData([
            //1 is a placeholder - we want to add 1 to the current number stored.
            "feeling-bad" : 1
        ], merge: true)
    }
}

struct StudentProblemView_Previews: PreviewProvider {
    static var previews: some View {
        StudentProblemView()
    }
}
