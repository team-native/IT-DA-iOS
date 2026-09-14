//
//  Status.swift
//  IT-DA-iOS
//
//  Created by 안율 on 9/8/26.
//

import SwiftUI

struct Status: View{
    var activity1 : String = ""
    var activity2 : String = ""
    var activity3 : String = ""
    var number1 : String = ""
    var number2 : String = ""
    var number3 : String = ""
    
    var body: some View{
        VStack(spacing: 0){
            HStack{
                Text(activity1)
                    .frame(maxWidth: .infinity)
                
                Text(activity2)
                    .frame(maxWidth: .infinity)
                
                Text(activity3)
                    .frame(maxWidth: .infinity)
            }
            
            .font(.custom("Pretendard-Regular", size: 16))
            .foregroundStyle(Color("place"))
            
            
            HStack(spacing: 0){
                Text(number1)
                    .frame(maxWidth: .infinity)
                
                Text(number2)
                    .frame(maxWidth: .infinity)
                
                Text(number3)
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

struct Status_Previews: PreviewProvider {
    static var previews: some View {
        Status(
            activity1: "지원 중",
            activity2: "참여 중",
            activity3: "완료",
            number1: "3",
            number2: "1",
            number3: "1"
        )
    }
}
