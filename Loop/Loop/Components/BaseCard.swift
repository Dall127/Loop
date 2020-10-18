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
    let cellHeight: CGFloat
    let cellWidth: CGFloat
    
	
    init(title: String, cellHeight: CGFloat,cellWidth: CGFloat, @ViewBuilder content: @escaping () -> Content) {
		self.title = title
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
				.frame(width: cellWidth, height:cellHeight, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .shadow(color:.gray, radius: 10,x:-7,y:7).overlay(
					VStack{
						HStack {
							Text(title)
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


struct BaseCard_Previews: PreviewProvider {
    static var previews: some View {
        BaseCard(title:"Assignments", cellHeight: 150.0, cellWidth: 300) {
            Text("ratgirl123321 peepeepoopoo sir isaac newton inveted calculus like bro what, the fitness gram pacer test")
    
		}
    }
}

