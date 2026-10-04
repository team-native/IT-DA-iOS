//
//  ITDAPrimaryButton.swift
//  IT-DA-iOS
//
//  Created by 민준김 on 7/8/26.
//

import SwiftUI

struct ITDAPrimaryButton: View {
    let title: String
    var isDisabled = false
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.custom("Pretendard-SemiBold", size: 20))
                .foregroundStyle(.white)
                .frame(maxWidth: .infinity)
                .frame(height: 48)
                .background(isDisabled ? Color("dim") : Color("main"))
                .clipShape(RoundedRectangle(cornerRadius: 9))
        }
        .buttonStyle(.plain)
        .disabled(isDisabled)
    }
}

struct ITDAPrimaryButton_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Spacer()
            ITDAPrimaryButton(title: "다음으로") {}
                .padding(.horizontal, 36)
            Spacer().frame(height: 48)
        }
        .frame(width: 393, height: 852)
        .background(.white)
    }
}
