//
//  ITDACheckbox.swift
//  IT-DA-iOS
//
//  Created by 민준김 on 7/21/26.
//

import SwiftUI

struct ITDACheckbox: View {
    @Binding var isChecked: Bool
    var action: ((Bool) -> Void)?

    var body: some View {
        Button {
            isChecked.toggle()
            action?(isChecked)
        } label: {
            RoundedRectangle(cornerRadius: 3)
                .fill(isChecked ? Color("main") : .white)
                .frame(width: 18, height: 18)
                .overlay {
                    RoundedRectangle(cornerRadius: 3)
                        .stroke(isChecked ? Color("main") : Color("border"), lineWidth: 1)
                }
                .overlay {
                    if isChecked {
                        Image(systemName: "checkmark")
                            .font(.system(size: 11, weight: .bold))
                            .foregroundStyle(.white)
                    }
                }
        }
        .buttonStyle(.plain)
    }
}

struct ITDACheckbox_Previews: PreviewProvider {
    struct PreviewScreen: View {
        @State private var checked = true
        @State private var unchecked = false

        var body: some View {
            HStack(spacing: 24) {
                ITDACheckbox(isChecked: $checked)
                ITDACheckbox(isChecked: $unchecked)
            }
            .frame(width: 393, height: 852)
            .background(.white)
        }
    }

    static var previews: some View {
        PreviewScreen()
    }
}
