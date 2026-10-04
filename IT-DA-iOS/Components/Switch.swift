//
//  ITDASwitch.swift
//  IT-DA-iOS
//
//  Created by 민준김 on 7/21/26.
//

import SwiftUI

struct ITDASwitch: View {
    @Binding var isOn: Bool
    var action: ((Bool) -> Void)?

    var body: some View {
        Button {
            isOn.toggle()
            action?(isOn)
        } label: {
            Capsule()
                .fill(isOn ? Color("on") : Color("off"))
                .frame(width: 31, height: 18)
                .overlay(alignment: isOn ? .trailing : .leading) {
                    Circle()
                        .fill(.white)
                        .frame(width: 16, height: 16)
                        .padding(.horizontal, 1)
                        .shadow(color: .black.opacity(0.14), radius: 1, x: 0, y: 1)
                }
        }
        .buttonStyle(.plain)
        .animation(.easeInOut(duration: 0.18), value: isOn)
    }
}

struct ITDASwitch_Previews: PreviewProvider {
    struct PreviewScreen: View {
        @State private var isOn = true
        @State private var isOff = false

        var body: some View {
            HStack(spacing: 24) {
                ITDASwitch(isOn: $isOn)
                ITDASwitch(isOn: $isOff)
            }
            .frame(width: 393, height: 852)
            .background(.white)
        }
    }

    static var previews: some View {
        PreviewScreen()
    }
}
