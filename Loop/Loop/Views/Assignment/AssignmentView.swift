//
//  AssignmentView.swift
//  Loop
//
//  Created by Guillermo Ramos  on 10/17/20.
//

import SwiftUI

struct AssignmentView: View {
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
                    GroupBox(label: Text("Problem 1")) {
                        
                        HStack{
                            Button(action: submitFeelingGood) {
                                Text("😃")
                            }
                            Button(action: submitFeelingGood) {
                                Text("🙁")
                            }
                        }
                    }
                    
                }
                
            }
        }
    }
    func submitFeelingGood(){
        
    }
    func submitFeelingBad(){
        
    }
}

struct AssignmentView_Previews: PreviewProvider {
    static var previews: some View {
        AssignmentView()
    }
}
