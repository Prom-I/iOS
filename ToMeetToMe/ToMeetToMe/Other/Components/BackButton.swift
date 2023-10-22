//
//  BackButton.swift
//  ToMeetToMe
//
//  Created by songyeon on 2023/10/11.
//

import SwiftUI

struct BackButton: View {
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        Button(action: {
            self.presentationMode.wrappedValue.dismiss()
        }) {
            HStack {
                Image(systemName: "chevron.left")
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(.black)
//                    .font(Font.system(size: 20))
            }
        }
    }
}

