//
//  ClassCard.swift
//  Loop
//
//  Created by Lissa Ramos on 10/17/20.
//

import SwiftUI

struct ClassCard: View {
     
        let className: String
       // let professor: String
        
        
        
    init(className:String, professor:String){
        self.className =  className
       // self.professor =  professor
    }
    var body: some View {
        VStack {
            Rectangle()
                .fill(Color.blue)
                .frame(height:60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .shadow(color:.gray, radius: 10,x:-7,y:7)
 
            HStack {
                VStack(alignment: .leading) {
                    Text(className)
                        .font(.title)
                        .fontWeight(.black)
                        .foregroundColor(.primary)
                        .lineLimit(3)
//                    Text(professor.uppercased())
//                        .font(.caption)
//                        .foregroundColor(.secondary)
                }
                .layoutPriority(100)
 
                Spacer()
            }
            .padding()
        }
        .cornerRadius(10)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color(.sRGB, red: 150/255, green: 150/255, blue: 150/255, opacity: 0.1), lineWidth: 1)
                .shadow(color:.gray, radius: 10.0)
        )
        .padding([.top, .horizontal])
    }
}

struct ClassCard_Previews: PreviewProvider {
    static var previews: some View {
        ClassCard(className: "CS 2420: Algorithms & Data Structures - 017")
    }
}
