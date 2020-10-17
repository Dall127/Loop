//
//  NueromorphicButton.swift
//  RoomCleaner
//
//  Created by Dallin Burton on 7/15/20.
//

import Foundation
import SwiftUI


struct NeumorphicButtonStyle: ButtonStyle {
	var bgColor: Color
	
	func makeBody(configuration: Self.Configuration) -> some View {
		configuration.label
			.padding(17.5)
			.background(
				ZStack {
					RoundedRectangle(cornerRadius: 10, style: .continuous)
						.shadow(color: .white, radius: configuration.isPressed ? 1.4: 2, x: configuration.isPressed ? -1: -5, y: configuration.isPressed ? -1: -5)
						.shadow(color: .black, radius: configuration.isPressed ? 1.4: 2, x: configuration.isPressed ? 1: 5, y: configuration.isPressed ? 1: 5)
						.blendMode(.overlay)
					RoundedRectangle(cornerRadius: 10, style: .continuous)
						.fill(bgColor)
				}
			)
			.scaleEffect(configuration.isPressed ? 0.95: 1)
			.foregroundColor(.primary)
			.animation(.spring())
	}
}

extension Color {
	init(hex: String) {
		let scanner = Scanner(string: hex)
		var rgbValue: UInt64 = 0
		scanner.scanHexInt64(&rgbValue)
		
		let r = (rgbValue & 0xff0000) >> 16
		let g = (rgbValue & 0xff00) >> 8
		let b = rgbValue & 0xff
		
		self.init(red: Double(r) / 0xff, green: Double(g) / 0xff, blue: Double(b) / 0xff)
	}
}
extension Color {
	static let neuBackground = Color(hex: "f0f0f3")
	static let dropShadow = Color(hex: "aeaec0").opacity(0.4)
	static let dropLight = Color(hex: "ffffff")
}


struct NueromorphicButton_Previews: PreviewProvider {
	static var previews: some View {
		Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
			HStack( content:
						{
							
							Text("Test Button ")
								.fontWeight(.medium);
							Image(systemName: "exclamationmark.triangle.fill").font(Font.title.weight(.medium));
						});
			
		}).buttonStyle(NeumorphicButtonStyle(bgColor: Color.neuBackground))
	}
}
