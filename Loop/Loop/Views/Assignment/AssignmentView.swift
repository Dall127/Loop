//
//  AssignmentView.swift
//  Loop
//
//  Created by Guillermo Ramos  on 10/17/20.
//

import SwiftUI
import FirebaseCore
import FirebaseFirestore
import FirebaseFirestoreSwift

struct AssignmentView<Content: View>: View {
    let content: Content
    init(@ViewBuilder content: () -> Content) {
            self.content = content()
    }
    
    //This will probably be within the ProblemView
    let db = Firestore.firestore()
    
    var body: some View {
        VStack{
            //This title will be pulled from the database
            Text("Assignment 1")
                .font(.title)
                .bold()
                .multilineTextAlignment(.leading)
                
            //List of problems
            //Must query from firebase to get a problem object.
            List {
                //This should be a VStack of Cards that take in a ProblemView
                //Each ProblemView needs to get its data from firebase
                VStack {
                    self.content
//                    GroupBox(label: Text("Problem 1")) {
//                        
//                        HStack{
//                            Button(action: submitFeelingGood) {
//                                Text("😃")
//                            }
//                            Button(action: submitFeelingBad) {
//                                Text("🙁")
//                            }
//                        }
//                    }
                    
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

struct AssignmentView_Previews: PreviewProvider {
    static var previews: some View {
        AssignmentView(){
            Text("Placeholder")
        }
    }
}
