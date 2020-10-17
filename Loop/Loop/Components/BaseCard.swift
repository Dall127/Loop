//
//  BaseCard.swift
//  Loop
//
//  Created by Lissa Ramos on 10/16/20.
//

import SwiftUI
import Foundation

struct BaseCard<Content>: View where Content: View {
	let title: String
	let content: Content
	
	init(title: String, @ViewBuilder content: @escaping () -> Content) {
		self.title = title
		self.content = content()
	}
	
	func sideContent<SideContent: View>(@ViewBuilder side: @escaping () -> SideContent) -> some View {
		HStack {
			body // body is just a View, so we can compose with this View
			side()
		}
	}
	
	var body: some View {
		
			RoundedRectangle(cornerRadius: 10.0, style: .continuous)
				.fill(Color.blue)
				.frame(width: 300, height:150, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
				.shadow(color:.blue, radius: 10).overlay(
					VStack{
						HStack {
							Text(title)
								.font(.title)
								.fontWeight(.black)
								.foregroundColor(.white)
							Spacer()
						}
						
						RoundedRectangle(cornerRadius: 10.0)
							.fill(Color.white)
							.frame(width: 275, height: 80, alignment: .center)
						
					}.overlay(content)
				)
	
	}
}


struct BaseCard_Previews: PreviewProvider {
    static var previews: some View {
		BaseCard(title:"Assignments") {
			Text("hi")
		}
    }
}

