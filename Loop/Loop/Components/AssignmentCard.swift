//
//  AssignmentCard.swift
//  Loop
//
//  Created by Dallin Burton on 10/18/20.
//

import Foundation
import SwiftUI
struct AssignmentCard<Content>: View where Content: View {
	let aClass: aClass
	let content: Content
	let cellHeight: CGFloat
	let cellWidth: CGFloat
	
	
	init(aClass: aClass, cellHeight: CGFloat,cellWidth: CGFloat, @ViewBuilder content: @escaping () -> Content) {
		self.aClass = aClass
		self.content = content()
		self.cellHeight = cellHeight
		self.cellWidth = cellWidth
	}
	
	func sideContent<SideContent: View>(@ViewBuilder side: @escaping () -> SideContent) -> some View {
		HStack {
			body // body is just a View, so we can compose with this View
			side()
		}
	}
	
	var body: some View {
		
		ZStack{
			RoundedRectangle(cornerRadius: 10.0, style: .continuous)
				.fill(Color.white)
				.frame(width: cellWidth, height:cellHeight)
				.overlay(
					VStack{
						HStack {
							Text(aClass.className)
								.font(.title)
								.fontWeight(.black)
								.foregroundColor(.black)
							
						}
						
						RoundedRectangle(cornerRadius: 10.0)
							.fill(Color.white)
							.frame(width: (cellWidth - 25), height: 80, alignment: .center)
						
						
					}
				)
			Spacer().frame(width: (cellWidth - 25), height: 80)
			self.content
				.frame(width: (cellWidth - 25), height: 80)
			
			
		}
		
	}
}
