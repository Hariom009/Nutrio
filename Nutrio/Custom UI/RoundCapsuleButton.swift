//
//  RoundCapsuleButton.swift
//  Nutrio
//
//  Created by Hari's Mac on 26.07.2025.
//

import SwiftUI

struct RoundCapsuleButton: View {
    var title: String
    var body: some View {
        Text("\(title)")
            .font(.subheadline)
            .foregroundStyle(.white)
            .padding(.horizontal,130)
            .padding(.vertical,20)
            .background(
                RoundedRectangle(cornerRadius: 18)
                    .foregroundColor(.primaryApp)
            )
    }
}
