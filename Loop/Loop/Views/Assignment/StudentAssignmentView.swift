//
//  StudentAssignmentView.swift
//  Loop
//
//  Created by Guillermo Ramos  on 10/17/20.
//

import SwiftUI

struct StudentAssignmentView: View {
    var body: some View {
        AssignmentView {
            StudentProblemView(problemName: "Problem 1", documentPath: "classes/MATH1220/assignments/assign02/problems/problem1")
        }
    }
}

struct StudentAssignmentView_Previews: PreviewProvider {
    static var previews: some View {
        StudentAssignmentView()
    }
}
