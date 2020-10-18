//
//  SwiftUIView.swift
//  Loop
//
//  Created by Dallin Burton on 10/17/20.
//

import SwiftUI

struct TransparentGroupBox: GroupBoxStyle {
	func makeBody(configuration: Configuration) -> some View {
		configuration.content
			.frame(maxWidth: .infinity)
			.padding()
			.background(RoundedRectangle(cornerRadius: 8).fill(Color(.systemRed)))
			.overlay(configuration.label.padding(.leading, 4), alignment: .topLeading)
	}
}
