//
//  BaseCard.swift
//  Loop
//
//  Created by Lissa Ramos on 10/16/20.
//

import SwiftUI

struct BaseCard: View{
    var Title:String
    var BodyLabel:String
    var body: some View {
		ZStack {

			
            RoundedRectangle(cornerRadius: 10.0, style: .continuous)
				.fill(Color.blue)
				.frame(width: 300, height:150, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .shadow(color:.blue, radius: 10)
                
            VStack{
               Text(Title)
                .font(.title)
                .fontWeight(.black)
                RoundedRectangle(cornerRadius: 10.0)
                    .fill(Color.white)
                    .frame(width: 275, height: 80, alignment: .center)
            
            }.overlay(Text(BodyLabel))
            Spacer()
        }
    }
}


struct BaseCard_Previews: PreviewProvider {
    static var previews: some View {
        BaseCard(Title:"Assignments", BodyLabel:"peepeepoopoo")
    }
}

