//
//  MenuViewController.swift
//  SliderTransition
//
//  Created by Bishowjit Ray on 13/4/21.
//

import UIKit
enum MenuType: Int {
    case Home
    case Profile
    case Camera
}
class MenuViewController: UITableViewController {
    var didTapMenu: ((MenuType)-> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let menuType = MenuType(rawValue: indexPath.row) else
        {return}
        dismiss(animated: true) {[self] in
        print("dismissing:\(menuType)")
            self.didTapMenu?(menuType)
    }

}
}
