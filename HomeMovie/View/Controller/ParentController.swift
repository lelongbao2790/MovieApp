//
//  ParentController.swift
//  HomeMovie
//
//  Created by Bao (Brian) L. LE on 8/13/20.
//  Copyright © 2020 Bao (Brian) L. LE. All rights reserved.
//

import UIKit

class ParentController: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
       // changeSelectedColor()
    }
//
//    func changeSelectedColor() {
//        let numberOfItems = CGFloat(tabBar.items!.count)
//        let tabBarItemSize = CGSize(width: tabBar.frame.width / numberOfItems, height: tabBar.frame.height )
//        tabBar.selectionIndicatorImage = UIImage.imageWithColor(UIColor.orange.withAlphaComponent(1), size: tabBarItemSize).resizableImage(withCapInsets: UIEdgeInsets.zero)
//    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
//
//extension UIImage {
//    class func imageWithColor(_ color: UIColor, size: CGSize) -> UIImage {
//        let rect: CGRect = CGRect(origin: CGPoint(x: 0,y :0), size: CGSize(width: size.width, height: size.height))
//        UIGraphicsBeginImageContextWithOptions(size, false, 0)
//        color.setFill()
//        UIRectFill(rect)
//        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
//        UIGraphicsEndImageContext()
//        return image
//    }
//
//}
