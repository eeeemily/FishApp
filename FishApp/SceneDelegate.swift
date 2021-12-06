//
//  SceneDelegate.swift
//  FishApp
//
//  Created by Zheng, Minghui on 12/5/21.
// reviews = FishInfo
//https://stackoverflow.com/questions/30592521/opening-view-controller-from-app-delegate-using-swift
import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var fishInfo = FishInfo()


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let _ = (scene as? UIWindowScene) else { return }
        loadFishes()
        if let navController = window?.rootViewController as? UINavigationController{
            if let vc = navController.viewControllers.last as? FishTVC{
                vc.fishInfo = fishInfo
                print("new!")
            }
        }
        
        
        
//        if let nav = UINavigationController(rootViewController: FishTVC()){
//
//        }
//        window!.rootViewController = nav
////        window?.rootViewController.
////        window.
//        if let vc = self.window?.rootViewController as? FishTVC{
//            vc.fishInfo = fishInfo
//            print("hello new")
//            print(fishInfo)
//        }
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        //never true
        if let vc = self.window?.rootViewController as? FishTVC {
            vc.fishInfo = fishInfo
            print("hello fishinfo")
            print(fishInfo)
        }
//        if let controller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "FishTVC") as? FishTVC {
//
//            if let window = self.window, let rootViewController = window.rootViewController {
//                print("hello fishinfo")
//                print(fishInfo.fishs.count)
//                controller.fishInfo = fishInfo
//                controller.
//                var currentController = rootViewController
//                while let presentedController = currentController.presentedViewController {
//                    currentController = presentedController
//                }
//                currentController.present(controller, animated: true, completion: nil)
//            }
        }
    

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }

    func loadFishes() {
        let urlJSON = "https://www.fishwatch.gov/api/species"
        guard let fishInfoURL = URL(string: urlJSON) else { return }
        guard let contents = try? Data(contentsOf: fishInfoURL) else { return }
        let library = JSON(contents).arrayValue
        
        for fish in library {
            fishInfo.addFish(name: fish["Species Name"].stringValue,
                 protein: fish["Protein"].stringValue,
                 quote: fish["Quote"].stringValue,
                 fisheries: fish["NOAA Fisheries Region"].stringValue)
//            print(fish["Species Name"].stringValue)
//            print(fish["Protein"].stringValue)
//            print(fish["Quote"].stringValue)
//            print(fish["NOAA Fisheries Region"].stringValue)

        }
//        print("second fish",fishInfo.fishs[indexPath.row].name)
        print("fish count",fishInfo.fishs.count)

    }
}

//        fishs.append(Fish(name: name, protein: protein, quote: quote, fisheries: fisheries))
