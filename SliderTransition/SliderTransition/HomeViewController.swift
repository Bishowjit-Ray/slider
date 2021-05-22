//
//  ViewController.swift
//  SliderTransition
//
//  Created by Bishowjit Ray on 13/4/21.
//

import UIKit

class HomeViewController: UIViewController {
let transition = slideIntran()
    var topView: UIView?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func didtapaMenu(_ sender: UIBarButtonItem) {
        guard let menuViewController = storyboard?.instantiateViewController(withIdentifier:"MenuViewController" ) as? MenuViewController else {return}
        menuViewController.didTapMenu = { menuType in
            self.transitionToNew(menuType)
        }
        menuViewController.modalPresentationStyle = .overCurrentContext
        menuViewController.transitioningDelegate = self
       present(menuViewController, animated: true)
    }
    func transitionToNew(_ menuType: MenuType){
        let title = String(describing: menuType).capitalized
        self.title =  title
        topView?.removeFromSuperview()
        switch menuType {
        case .Profile:
            let view = UIView()
            view .backgroundColor = .yellow
            view.frame = self.view.bounds
            self.view.addSubview(view)
            self.topView = view
        case .Camera:
            let view = UIView()
            view .backgroundColor = .systemPink
            view.frame = self.view.bounds
            self.view.addSubview(view)
            self.topView = view
        case .Home:
            let view = UIView()
            view .backgroundColor = .systemGray4
            view.frame = self.view.bounds
            self.view.addSubview(view)
            self.topView = view
        default:
            break
        }
    }
    
}
extension HomeViewController: UIViewControllerTransitioningDelegate{
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.ispresenting = true
        return transition
    }
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.ispresenting = false
        return transition
        
    }
}



