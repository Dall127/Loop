//
//  StudentAssignmentView.swift
//  Loop
//
//  Created by Guillermo Ramos  on 10/17/20.
//

import SwiftUI
import FirebaseFirestore

struct StudentAssignmentView: View {
    let db = Firestore.firestore()
    let assignmentPath: String
    init(assignmentPath: String) {
        self.assignmentPath = assignmentPath
    }
    var body: some View {
        let documentPaths = fetchDocumentPaths()
        AssignmentView {
            VStack{
                ForEach(0..<documentPaths.count) { index in
                    self.buildView(path: documentPaths[index])
                }
                
            }
            
        }
    }
    
    func buildView(path: String) -> StudentProblemView {
        return StudentProblemView(documentPath: path)
    }
    
    func fetchDocumentPaths() -> Array<String>{
        var paths = [String]()
        db.document(assignmentPath).collection("problems").addSnapshotListener { (querySnapshot, err) in
            if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    for document in querySnapshot!.documents {
                        let currentDocumentPath = document.reference.path
                        paths.append(currentDocumentPath)
                }
            }
        }
        return paths
    }
}

struct StudentAssignmentView_Previews: PreviewProvider {
    static var previews: some View {
        StudentAssignmentView(assignmentPath: "assign02")
    }
}

