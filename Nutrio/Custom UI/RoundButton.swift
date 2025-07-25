//
//  RoundButton.swift
//  Nutrio
//
//  Created by Hari's Mac on 13.06.2025.
//

import SwiftUI

struct RoundButton: View {
    @State var title: String = "Title"
    var didTap: (() -> ())?
    var body: some View {
        Button{
            didTap?()
        }label: {
            Text(title)
               .font(.customfont(.bold, fontSize: 18))
               .foregroundStyle(.white)
               .multilineTextAlignment(.center)
        }
        .frame(minWidth: 0,maxWidth: .infinity,minHeight: 60,maxHeight: 60)
        .background(Color.primaryApp)
        .cornerRadius(20)
    }
}

#Preview {
    RoundButton()
}
