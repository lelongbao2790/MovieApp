//
//  FeatureFilmController.swift
//  HomeMovie
//
//  Created by Diep (Rocky) X.MAI on 8/19/20.
//  Copyright © 2020 Bao (Brian) L. LE. All rights reserved.
//

import UIKit

class FeatureFilmController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    //
    // MARK: Properties
    //
    @IBOutlet weak var TbvTag: UITableView!
    
    //
    // MARK: Life Cycle Methods
    //
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //
    // MARK: UITableViewDataSource, UITableViewDelegate Methods
    //
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TitleMenu.FeaturesTagMenu.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: TagCell = self.TbvTag.dequeueReusableCell(withIdentifier: StoryboardId.TagCellId, for: indexPath) as! TagCell
        cell.title = TitleMenu.FeaturesTitleMenu[indexPath.row]
        return cell
    }
    
    //
    // MARK: Actions
    //
    @IBAction func gotoTagController(_ sender: UIButton) {
        let controller: TagController = self.storyboard?.instantiateViewController(withIdentifier: StoryboardId.TagControllerId) as! TagController
        controller.tagKey = sender.currentTitle
        controller.genre = Genre.Feature.rawValue
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    //
    // MARK: Prepare -> Segues 
    //
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.destination is TagController {
//            let controller = segue.destination as! TagController
//            let btnTag: UIButton = sender as! UIButton
//            controller.tagName = btnTag.currentTitle
//            controller.genre = Genre.Feature.rawValue
//        }
//    }

}
