//
//  AddClassView.swift
//  Loop
//
//  Created by Lissa Ramos on 10/18/20.
//

import SwiftUI
import Firebase

struct AddClassView: View {
    @Environment(\.presentationMode) var presentation
    @EnvironmentObject var session: SessionStore

    var existingClasses : Array<String>
    @State var randomID = ""
    @State var codeName = ""
    @State var showingAlert = false
    var db = Firestore.firestore()

    func randomString(length: Int) -> String {
        let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        return String((0..<length).map{ _ in letters.randomElement()! })
    }
    var body: some View {
       
        VStack {
            Spacer()
            GroupBox{
                Text("Enter the code of the class you want to add")
                    .font(.footnote)
                TextField("Class Code", text: $codeName).textContentType(.username).padding(.horizontal, 20.0).textFieldStyle(RoundedBorderTextFieldStyle()).foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
            }
            .padding(.horizontal, 15.0)
            Spacer()
            Button(action: {
            
                if(codeName == "") {
                    showingAlert = true
                }
                else {
                    db.collection("students").document(session.session!.uid).setData([
                        "classes" : []
                        
                    ]) { err in
                        if let err = err {
                            print("Error writing document: \(err)")
                        } else {
                            print("Document successfully written!")
                        }
                    }
                    
                    db.collection("students").document(session.session!.uid).updateData([
                        "classes" : FieldValue.arrayUnion([db.collection("classes").document(codeName)])
                        
                    ]) { err in
                        if let err = err {
                            print("Error writing document: \(err)")
                        } else {
                            print("Document successfully written!")
                        }
                    }
                    
                    
                    
                    self.presentation.wrappedValue.dismiss()

                }
            },
            label: {
                HStack {
                    Spacer()
                    Text("Add")
                        .fontWeight(.medium)
                        .foregroundColor(.white)
                    Image(systemName: "plus.square.fill").font(Font.title.weight(.medium)).foregroundColor(.white);
                    Spacer()
                }
                
                        
            }).padding(.horizontal, 15.0).buttonStyle(NeumorphicButtonStyle(bgColor: .systemBlue))
                
        }.navigationBarTitle(Text("Add Class"), displayMode: .inline).onAppear(perform: {
            self.randomID = randomString(length: 8)
        }).alert(isPresented: $showingAlert) { Alert(title: Text("Oops"), message: Text("A class with this name already exists, or was empty. Please Try Again"), dismissButton: .default(Text("Close")))}

    
    }
    
        
}

struct AddClassView_Previews: PreviewProvider {
    static var previews: some View {
        AddClassView(existingClasses: Array<String>())
    }
}
