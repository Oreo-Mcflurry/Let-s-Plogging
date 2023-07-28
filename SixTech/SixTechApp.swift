//
//  SixTechApp.swift
//  SixTech
//
//  Created by 이재원 on 2023/07/09.
//

import SwiftUI
import CoreData

@main
struct SixTechApp: App {
    @StateObject var matchManager = MatchManager()
    @StateObject var historyManager = CoredataManager()
    @StateObject var userInfo = UserInfo()
    @AppStorage("onboarding") var isOnboardingActive: Bool = true
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                if isOnboardingActive {
                    OnBoardingView()
                } else {
                    MainView()
                }
            }
            .environmentObject(matchManager).environmentObject(userInfo)
//            .environmentObject(historyManager)
        }

    }
}
