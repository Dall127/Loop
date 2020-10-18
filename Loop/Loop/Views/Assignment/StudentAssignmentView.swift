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
        let documentPaths: Array<String> = self.fetchDocumentPaths()
        AssignmentView {
            VStack{
                ForEach(0..<documentPaths.count) { index in
                    self.buildView(path: documentPaths[index])
                }
            }
            
        }
    }
    
    func buildView(path: String) -> StudentProblemView {
        print("view built")
        return StudentProblemView(documentPath: path)
    }
    
    func fetchDocumentPaths() -> Array<String>{
        var paths = [String]()
        db.document(assignmentPath).collection("problems").addSnapshotListener { (querySnapshot, err) in
            guard let documents = querySnapshot?.documents else {
                print("No documents") // the printing is done here
                return
            }
            for queryDocumentSnapshot in documents {
                let currentDocumentPath = queryDocumentSnapshot.reference.path
                paths.append(currentDocumentPath)
            }
            
        }
        print(paths)
        return paths
    }
}

struct StudentAssignmentView_Previews: PreviewProvider {
    static var previews: some View {
        StudentAssignmentView(assignmentPath: "classes/MATH1220/assignments/assign02")
    }
}

