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

struct AssignmentsView: View {
	var aAssignmentHolder : aAssignment
	
	//This will probably be within the ProblemView
	let db = Firestore.firestore()
	
	var body: some View {
		
		VStack{
			Assignemnts(aClass: self.aAssignmentHolder.aClass)
			Text("here")
			//This title will be pulled from the database
			


		}.navigationBarTitle(self.aAssignmentHolder.aClass.className, displayMode: .inline)
	}

}

