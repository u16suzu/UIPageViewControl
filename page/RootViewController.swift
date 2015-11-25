
import UIKit

class RootViewController: UIViewController, UIPageViewControllerDelegate {
    var pageViewController: UIPageViewController?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.pageViewController = UIPageViewController(transitionStyle: .Scroll, navigationOrientation: .Horizontal, options: nil)
        self.pageViewController!.delegate = self

        let startingViewController: DataViewController = self.modelController.viewControllerAtIndex(0, storyboard: self.storyboard!)!
        
        let viewControllers = [startingViewController]
        self.pageViewController!.setViewControllers(viewControllers, direction: .Forward, animated: false, completion: {done in })
        self.pageViewController!.dataSource = self.modelController
        self.addChildViewController(self.pageViewController!)
        self.view.addSubview(self.pageViewController!.view)
        var pageViewRect = self.view.bounds
        if UIDevice.currentDevice().userInterfaceIdiom == .Pad {
            pageViewRect = CGRectInset(pageViewRect, 40.0, 40.0)
        }
        self.pageViewController!.view.frame = pageViewRect
        self.pageViewController!.didMoveToParentViewController(self)
        self.view.gestureRecognizers = self.pageViewController!.gestureRecognizers
    }

    var modelController: ModelController {
        if _modelController == nil {
            _modelController = ModelController()
        }
        return _modelController!
    }

    var _modelController: ModelController? = nil

}

