//
//  AppDelegate.swift
//  Kurly_mock
//
//  Created by taehy.k on 2021/03/13.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // LaunchScreen 로딩 후에 1초(임의시간) 대기
        // - 이 시간은 나중에 메인에서 데이터 로딩 완료 시간에 따라 달라지겠지?
        sleep(1)

        
        
        // 앱 시작 시 탭 바 스타일 적용
        // - Base VC 에서 작동안함
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: UIFont.NotoSans(.regular, size: 9)], for: .normal)
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

