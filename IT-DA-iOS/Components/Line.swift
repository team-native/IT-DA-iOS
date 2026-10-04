//
//  ITDALine.swift
//  IT-DA-iOS
//
//  Created by 민준김 on 7/21/26.
//

import SwiftUI

struct ITDALine1: View {
    var body: some View {
        Image("Line 1")
            .resizable()
            .renderingMode(.original)
            .frame(maxWidth: .infinity)
            .frame(height: 1)
    }
}

struct ITDALine2: View {
    var body: some View {
        Image("Line 2")
            .resizable()
            .renderingMode(.original)
            .frame(maxWidth: .infinity)
            .frame(height: 1)
    }
}

struct ITDALine3: View {
    var body: some View {
        Image("Line 3")
            .resizable()
            .renderingMode(.original)
            .frame(maxWidth: .infinity)
            .frame(height: 1)
    }
}

struct ITDALine_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 24) {
            ITDALine1()
            ITDALine2()
            ITDALine3()

            Rectangle()
                .fill(Color("border"))
                .frame(height: 1)

            Rectangle()
                .fill(Color("line"))
                .frame(width: 1, height: 44)
        }
        .padding(.horizontal, 36)
        .frame(width: 393, height: 852)
        .background(.white)
    }
}
