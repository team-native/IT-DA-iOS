
import SwiftUI

struct ITDAloginmain: View {
    let id = "아이디"
    let pw = "비밀번호"
    let NextButton = "로그인"
    let question = "IT-DA가 처음이신가요?"
    let ITDAjointhemembership = "회원가입하기"
    let buttomText = "소셜 로그인으로 간편하게 가입하고 시작하세요"
    var isDisabled = false
    var body: some View {
        VStack(spacing: 0) {
            Image("IT-DA logo")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .padding(.top, 45)

            ITDAstartdiscription()
                .padding(.top, 43.5)

        }
            Text(id)
                .frame(maxWidth:.infinity,alignment:.leading)
                .padding(.top, 66.5)
                .padding(.leading, 57)
                .foregroundStyle(Color("place"))
                .font(.custom("Pretendard-Light", size: 14))

            Image("Line 2")
                .resizable()
                .frame(width: 295 , height: 1)
                .padding(.top, 3.5)
            
            Text(pw)
                .frame(maxWidth:.infinity,alignment:.leading)
                .padding(.top, 19.5)
                .padding(.leading, 57)
                .foregroundStyle(Color("place"))
                .font(.custom("Pretendard-Light", size: 14))
        
            Image("Line 2")
                .resizable()
                .frame(width: 295, height: 1)
                .padding(.top, 3.5)
        
        HStack{
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
        HStack{
            Text(question)
                .font(.custom("Pretendard-Regular",size : 13))
                .foregroundStyle(Color("place"))
                .padding(.leading, 101)
                .padding(.top, 15)
            Text(ITDAjointhemembership).underline()
                .font(.custom("Pretendard-Medium",size : 13,))
                .foregroundStyle(Color("border"))
                .padding(.trailing, 101)
                .padding(.top, 15)
        }
        HStack{
            Image("apple")
                .frame(maxWidth:.infinity,alignment:.leading)
                .padding(.leading, 122.5)
                .padding(.top,81.5)
            Image("google")
                .padding(.horizontal,8.5)
                .padding(.top,81.5)
            Image("kakao")
                .frame(maxWidth: .infinity,alignment:.trailing)
                .padding(.trailing,122.5)
                .padding(.top,81.5)
        }
       
       Spacer()
    }
}

#Preview {
    ITDAloginmain()
}
