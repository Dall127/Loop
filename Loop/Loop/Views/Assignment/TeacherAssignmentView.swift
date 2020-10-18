//
//  TeacherAssignmentView.swift
//  Loop
//
//  Created by Guillermo Ramos  on 10/17/20.
//

import SwiftUI

struct TeacherAssignmentView: View {
    var body: some View {
        AssignmentView{
            TeacherProblemView()
        }
    }
}

struct TeacherAssignmentView_Previews: PreviewProvider {
    static var previews: some View {
        TeacherAssignmentView()
    }
}
