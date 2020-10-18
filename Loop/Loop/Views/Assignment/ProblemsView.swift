//
//  StudentAssignmentView.swift
//  Loop
//
//  Created by Guillermo Ramos  on 10/17/20.
//

import SwiftUI
import FirebaseFirestore

struct ProblemsView: View {
    let db = Firestore.firestore()
    
    let assignmentPath: String
    init(assignmentPath: String) {
        self.assignmentPath = assignmentPath
    }
    var body: some View {
        Spacer().onAppear(perform: {
            db.document(assignmentPath).collection("problems").getDocuments() { (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    var i = 0
                    for document in querySnapshot!.documents {
                        paths[i] = document.reference.path
                        i+=1
                    }
                }
            }
        })
        List{
            ForEach(0..<paths.count, id: \.self) { i in
                StudentProblemView(documentPath: paths[i])
            }
        }
    }
    
}
private var paths = [String]()

struct ProblemsView_Previews: PreviewProvider {
    static var previews: some View {
        ProblemsView(assignmentPath: "classes/MATH1220/assignments/assign02")
    }
}

