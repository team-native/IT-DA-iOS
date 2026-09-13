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
                    .frame(maxWidth: .infinity)
                    
                
                Text(joining)
                    .frame(maxWidth: .infinity)
                
                Text(completed)
                    .frame(maxWidth: .infinity)
            }
            
            .font(.custom("Pretendard-Regular", size: 16))
            .foregroundStyle(Color("place"))
            
            
            HStack(spacing: 0){
                Text("3")
                    .frame(maxWidth: .infinity)
                
                Text("1")
                    .frame(maxWidth: .infinity)
                
                Text("1")
                    .frame(maxWidth: .infinity)
            }
            .padding(.top,14.5)
            
        }
                
        .frame(width:339, height: 93.5)
            .overlay {
                RoundedRectangle(cornerRadius: 9)
                    .stroke(Color("off"), lineWidth: 1)
                    
                    
            
        }
        
    }
}

#Preview{
    Status()
}
