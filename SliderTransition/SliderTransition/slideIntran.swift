
import UIKit

class slideIntran: NSObject,UIViewControllerAnimatedTransitioning  {
  var ispresenting = false
    let dimmingView = UIView ()
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.3
    }
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let toViewController = transitionContext.viewController(forKey: .to),
              let fromViewController = transitionContext.viewController(forKey: .from) else {return}
        let containerView = transitionContext.containerView
        let finalWidth = toViewController.view.bounds.width * 0.8
        let finalHeigh = toViewController.view.bounds.height
        if ispresenting{
            //Add dimming view
            dimmingView.backgroundColor = .black
            dimmingView.alpha = 0.0
            containerView.addSubview(dimmingView)
            dimmingView.frame = containerView.bounds
            //add menu View controller to container
            containerView.addSubview(toViewController.view)
            //init fram off the screen
            toViewController.view.frame = CGRect(x: -finalWidth, y: 0, width: finalWidth, height: finalHeigh)
        }
            // animated on Screen
        let transform = {
            self.dimmingView.alpha = 0.5
            toViewController.view.transform = CGAffineTransform(translationX: finalWidth, y: 0)
        }
        // animated back off screen
        let identity = {
            self.dimmingView.alpha = 0.0
            fromViewController.view.transform = .identity
        }
        //animation of the transition
        let duration = transitionDuration(using: transitionContext)
        let isCancelled = transitionContext.transitionWasCancelled
        UIView.animate(withDuration: duration, animations: {
            self.ispresenting ? transform (): identity()
        }) { (_) in
            transitionContext.completeTransition(!isCancelled)
        }
         
    }
}
