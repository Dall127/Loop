//
//  ClassCard.swift
//  Loop
//
//  Created by Lissa Ramos on 10/17/20.
//

import SwiftUI

struct ClassCard: View {
    
	init(aClassHolder: aClass) {
		self.className = aClassHolder.className
		self.classCode = aClassHolder.classCode
	}
	
        let className: String
       let classCode: String
        
        

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
                    Text(classCode)
                        .font(.caption)
                        .foregroundColor(.secondary)
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
		ClassCard(aClassHolder: aClass(className: "", classCode: ""))
    }
}
