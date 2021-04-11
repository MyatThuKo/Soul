//
//  PasswordFields.swift
//  Soul
//
//  Created by Aswani G on 4/10/21.
//

import SwiftUI

struct PasswordField: View {
    @Binding private var text: String
    @State private var isSecured: Bool = true
    private var hintText: String
    
    init(_ hintText: String, text: Binding<String>) {
        self.hintText = hintText
        self._text = text
    }
    
    var body: some View {
        ZStack(alignment: .trailing) {
            if isSecured {
                SecureField(hintText, text: $text)
            } else {
                TextField(hintText, text: $text)
            }
            Button(action: {
                isSecured.toggle()
            }) {
                Image(systemName: self.isSecured ? "eye.slash" : "eye")
                    .accentColor(.gray)
            }
        }
    }
    
}

struct PasswordFields_Previews: PreviewProvider {
    static var previews: some View {
        PasswordField("Password", text: .constant(""))
    }
}
