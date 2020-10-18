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
    let assignmentName: String
    
    init(assignmentName: String, assignmentPath: String) {
        self.assignmentName = assignmentName
        self.assignmentPath = assignmentPath
    }
    
    var body: some View {
        VStack{
            Text(assignmentName)
                .font(.title)
                .bold()
                .multilineTextAlignment(.leading)
            Spacer().onAppear(perform: {fetchDocumentPaths()})
            List{
                VStack{
                    ForEach(0..<paths.count, id: \.self) { i in
                        //StudentProblemView(documentPath: paths[i])
                        Text(paths[i])
                    }
                }
            }
        }
    }
        
    func fetchDocumentPaths(){
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
    }
}
private var paths = [String]()


struct ProblemsView_Previews: PreviewProvider {
    static var previews: some View {
        ProblemsView(assignmentName: "Assignment 2", assignmentPath: "classes/MATH1220/assignments/assign02")
    }
}

