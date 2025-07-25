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
            .foregroundStyle(.white)
            .padding(.horizontal,.screenWidth - 270)
            .padding(.vertical,20)
            .background(
                RoundedRectangle(cornerRadius: 18)
                    .foregroundColor(.primaryApp)
            )
    }
}
