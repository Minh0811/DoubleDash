//
//  Extensions.swift
//  DoubleDash
//
//  Created by Minh Vo on 30/08/2023.
//

import SwiftUI

extension View {
    func customBackButton(presentationMode: Binding<PresentationMode>) -> some View {
        self
            .navigationBarBackButtonHidden(true)
            .toolbar(content: {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }, label: {
                        ZStack{
                            Rectangle()
                                .fill(Color.black)
                                .frame(width: 40, height: 40)
                            Image(systemName: "multiply.square.fill")
                                .foregroundColor(.white)
                                .font(.system(size: 40))
                        }
                    })
                }
            })
    }
}
