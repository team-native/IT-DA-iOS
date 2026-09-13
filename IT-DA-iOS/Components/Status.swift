//
//  Status.swift
//  IT-DA-iOS
//
//  Created by 안율 on 9/8/26.
//

import SwiftUI
struct Status: View{
    let joining = "참여 중"
    let supporting = "지원 중"
    let completed = "완료"
    var body: some View{
        VStack(spacing: 0){
            HStack{
                Text(supporting)
                    .frame(alignment:.leading)
                    .padding(.leading, 44.5)
                
                Text(joining)
                    .padding(.horizontal, 44.5)
                
                Text(completed)
                    .padding(.trailing,44.5)
                    
            }
            .font(.custom("Pretendard-Regular", size: 16))
            .foregroundStyle(Color("place"))
                
            .frame(width:342, height: 97)
            .overlay {
                RoundedRectangle(cornerRadius: 9)
                    .stroke(Color("off"), lineWidth: 1)
                    
                    
            }
        }
        
    }
}

#Preview{
    Status()
}
