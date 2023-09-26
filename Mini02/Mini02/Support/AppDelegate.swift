//
//  AppDelegate.swift
//  Mini02
//
//  Created by Luca Lacerda on 21/09/23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var dataController: DataController!

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        dataController = DataController()
        
        if let storeURL = DataController.persistentContainer.persistentStoreCoordinator.persistentStores.first?.url {
            let path = storeURL.path
            print("O caminho do arquivo SQLite é: \(path)")
        }
        
        seedIfWasntSeeded()
        
        return true
    }
    
    
    func seedIfWasntSeeded() {
        
        
        do {
            let user = try User.getUser(dataController: dataController)
            
            if (user.was_seeded) { return }
            
            startSeed()
            
            user.was_seeded = true
            
            do {
                try dataController.save()
            } catch {
                fatalError("Error when saving user after seeding")
            }
        } catch {
            fatalError("Error on method seedIfWasntSeeded: \(error)")
        }
        
        func startSeed() {
            let seederManager = SeederManager()
            
            seederManager.start()
        }
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

