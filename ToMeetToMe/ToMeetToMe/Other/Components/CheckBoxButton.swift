//
//  CheckBoxButton.swift
//  ToMeetToMe
//
//  Created by songyeon on 2023/10/15.
//

import SwiftUI

struct CheckBoxButton: View {
    
    @Binding var isChecked: Bool

    var body: some View {
        Button(action: {
            if (!isChecked){
                isChecked = true
            }
            
        }) {
            HStack {
                Image(systemName: isChecked ? "checkmark.circle.fill" : "circle")
                    .resizable()
                    .frame(width: 25, height: 25)
                    .foregroundColor(isChecked ? Color.mintColor : .gray)
            }
        }
        .padding()
    }
}
