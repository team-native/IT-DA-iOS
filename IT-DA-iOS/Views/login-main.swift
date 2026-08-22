
import SwiftUI

struct ITDAloginmain: View {
    let id = "아이디"
    let pw = "비밀번호"
    let NextButton = "로그인"
    var isDisabled = false
    var body: some View {
        VStack(spacing: 0) {
            Image("IT-DA logo")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .padding(.top, 45)

            ITDAstartdiscription()
                .padding(.top, 46)

        }
            Text(id)
                .frame(maxWidth:.infinity,alignment:.leading)
                .padding(.top, 69)
                .padding(.leading, 57)
                .foregroundStyle(Color("place"))
                .font(.custom("Pretendard-Light", size: 14))

            Image("Line 2")
                .resizable()
                .frame(width: 295 , height: 1)
                .padding(.top, 3.5)
            
            Text(pw)
                .frame(maxWidth:.infinity,alignment:.leading)
                .padding(.top, 23)
                .padding(.leading, 57)
                .foregroundStyle(Color("place"))
                .font(.custom("Pretendard-Light", size: 14))
        
            Image("Line 2")
                .resizable()
                .frame(width: 295, height: 1)
                .padding(.top, 3.5)
        
        ZStack{
            Button{
                print("로그인버튼클릭")
            } label: {
                Text(NextButton)
                    .font(.custom("Pretendard-Bold", size:15))
                    .foregroundColor(.white)
                    .frame(maxWidth:.infinity)
                    .frame(height: 45)
                    .frame(width: 322)
                    .background(isDisabled ? Color("main"): Color("dim"))
                    .clipShape(RoundedRectangle(cornerRadius: 10000))
            }
                    .padding(.top, 27.5)
        }
             
        
        
            Spacer()
            
    }
}

#Preview {
    ITDAloginmain()
}
