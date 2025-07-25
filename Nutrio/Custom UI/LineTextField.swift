//
//  LineTextField.swift
//  Nutrio
//
//  Created by Hari's Mac on 13.06.2025.
//

import SwiftUI

struct LineTextField: View {
    @Binding var txt: String
    @State var placeholder: String = "Placeholder"
    @State var title: String = "Title"
    @State var keyboardType: UIKeyboardType = .default
    var body: some View {
        VStack{
            Text("\(title)")
                .font(.customfont(.medium, fontSize: 18))
                .foregroundColor(.secondaryText)
                .frame(minWidth: 0,maxWidth: .infinity,alignment: .leading)
            
                TextField("\(placeholder)",text: $txt)
                    .keyboardType(keyboardType)
                    .disableAutocorrection(true)
                    .autocapitalization(.none)
                    .frame(height: 40)
            Divider()
        }
    }
}
struct LineSecureField: View {
    @Binding var txt: String
    @Binding var ShowPassword: Bool
    
    @State var placeholder: String = "Placeholder"
    @State var title: String = "Title"
    
    var body: some View {
        VStack{
            Text("\(title)")
                .font(.customfont(.medium, fontSize: 18))
                .foregroundColor(.secondaryText)
                .frame(minWidth: 0,maxWidth: .infinity,alignment: .leading)
            
            if ShowPassword{
                TextField("\(placeholder)",text: $txt)
                    .modifier(ShowButton(isShow: $ShowPassword))
                    .disableAutocorrection(true)
                    .frame(height: 40)
            }else{
                SecureField(placeholder, text: $txt)
                    .modifier(ShowButton(isShow: $ShowPassword))
                    .frame(height: 40)
            }
            Divider()
        }
    }
}

