//
//  WaitingRoomView.swift
//  SixTech
//
//  Created by 주환 on 2023/07/20.
//

import SwiftUI

struct WaitingRoomView: View {
    @EnvironmentObject var matchManager: MatchManager
    @Environment(\.dismiss) var dismiss
    
    @State var isAlert = false
    @State var isFirst = true
    var groupCode: String?
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    Text("대기실")
                        .font(.Jamsil.bold.font(size: 24))
                    
                    Text("모두 도착할 때까지 기다려요.")
                        .font(.Jamsil.light.font(size: 20))
                    
                    Image("onboarding_character")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 136, height: 136)
                        .background(
                            Circle().fill(Color.background2Color)
                                .frame(width: 170, height: 170)
                        )
                        .padding()
                    
                    Text("들린매스크")
                        .font(.Jamsil.bold.font(size: 25))
                        .padding()
                    
                    ScrollView {
                        PlayerCellView(image: "onboarding_character"
                                       , nickName: matchManager.localPlayer.displayName)
                        if matchManager.otherPlayer != nil {
                            ForEach(matchManager.otherPlayer!, id: \.self) { _ in
                                PlayerCellView(image: "onboarding_character", nickName: matchManager.lastData)
                            }
                        }
                    }.background(
                        RoundedRectangle(cornerRadius: 40).fill(Color.background2Color)
                    )
                    .clipShape(RoundedRectangle(cornerRadius: 40))
                    
                }
                .overlay {
                    VStack {
                        Text("􀁜 모든 멤버가 입장하면 시작할 수 있어요.")
                            .font(.Jamsil.light.font(size: 14))
                            .foregroundColor(.gray)
                            .offset(y: 300)
                        NavigationLink("시작하기") {
                        }.buttonStyle(DefaultButton(isdisable: false))
                            .offset(y: 300)
                    }
                }
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        dismissButton(sfName: "xmark") {
                            isAlert = true
                        }
                    }
                }
            }
        }
        .navigationBarBackButtonHidden()
            .onAppear {
                if let playCode = groupCode, isFirst {
                    matchManager.groupNumber = playCode
                    matchManager.startMatchmaking(nil)
                    isFirst = false
                } else if isFirst {
                    matchManager.startMatchmaking(nil)
                    isFirst = false
                }
            }
            .alert(title: "대기실 나가기", message: "메인 화면으로 돌아갑니다.",
                   primaryButton: CustomAlertButton(title: "나가기", action: {
                matchManager.cancelMatchmaking()
                dismiss() }),
                   secondaryButton: CustomAlertButton(title: "취소", action: { isAlert.toggle() }),
                   isPresented: $isAlert)
    }
}

struct PlayerCellView: View {
    let image: String
    let nickName: String
    
    var body: some View {
        HStack {
            Image(image)
                .resizable()
                .frame(width: 80, height: 80)
                .scaledToFill()
                .background(
                    Circle()
                        .fill(Color.backgroundColor)
                        .frame(width: 100, height: 100)
                )
                .padding(.all, 20)
            Text(nickName)
                .font(.Jamsil.regular.font(size: 25))
            Spacer()
            
        }.frame(width: 342)
    }
}