//
//  BaseCard.swift
//  Loop
//
//  Created by Lissa Ramos on 10/16/20.
//

import SwiftUI

struct BaseCard: View{
    var Title:String
    var TextBody:String
    var body: some View {
		ZStack {

			
			RoundedRectangle(cornerRadius: 25, style: .continuous)
				.fill(Color.red)
				.frame(width: /*@START_MENU_TOKEN@*/115/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
			RoundedRectangle(cornerRadius: 25, style: .continuous)
				.fill(Color.blue)
				.frame(width: 80, height: 80, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
			Text("")
		}
		
    }
}


struct BaseCard_Previews: PreviewProvider {
    static var previews: some View {
        BaseCard(Title:"Assignments", TextBody: "peepeepoopoo")
    }
}

