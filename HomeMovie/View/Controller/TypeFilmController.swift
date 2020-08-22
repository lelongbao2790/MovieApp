//
//  FeatureFilmController.swift
//  HomeMovie
//
//  Created by Diep (Rocky) X.MAI on 8/19/20.
//  Copyright © 2020 Bao (Brian) L. LE. All rights reserved.
//

import UIKit

class TypeFilmController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    //
    // MARK: Properties
    //
    var typeFilm: TypeFilm = TypeFilm.Feature
    @IBOutlet weak var TbvTag: UITableView!
    
    //
    // MARK: Life Cycle Methods
    //
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        var typeFilmIndex: Int = self.tabBarController?.selectedIndex as! Int
        if typeFilmIndex == StoryboardId.FeatureFilmTabBarIndex {
            typeFilm = TypeFilm.Feature
        }
        else if typeFilmIndex == StoryboardId.TelevisionFilmTabBarIndex {
            typeFilm = TypeFilm.Television
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.title = typeFilm.titleNavigation
    }
    
    //
    // MARK: UITableViewDataSource, UITableViewDelegate Methods
    //
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return typeFilm.TagKey.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: TagCell = self.TbvTag.dequeueReusableCell(withIdentifier: StoryboardId.TagCellId, for: indexPath) as! TagCell
        cell.title = typeFilm.TagValue[indexPath.row]
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
