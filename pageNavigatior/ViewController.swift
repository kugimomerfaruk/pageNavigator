
import UIKit

class ViewController: UIPageViewController,
UIPageViewControllerDelegate,
UIPageViewControllerDataSource {
    
    //FirstSliderViewController
    //SecondSliderViewController
    //ThirdSliderViewController
    
    

    lazy var viewControllerList : [UIViewController] = {
        
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let viewController1 = storyBoard.instantiateViewController(withIdentifier: "FirstSliderViewController")
        let viewController2 = storyBoard.instantiateViewController(withIdentifier: "SecondSliderViewController")
        let viewController3 = storyBoard.instantiateViewController(withIdentifier: "ThirdSliderViewController")
        
        return [viewController1,viewController2,viewController3]
    }()
    
    // Page Before Begin
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard let vcIndex = viewControllerList.index(of: viewController) else {
        return nil
        }
        
        let previousIndex = vcIndex - 1
        
        guard previousIndex >= 0 else {
        return nil
        }
        
        guard viewControllerList.count > previousIndex else {
        return nil
        }
        
        return viewControllerList[previousIndex]
    }
    // Page Before End
    
    // Page After Begin
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let vcIndex = viewControllerList.index(of: viewController) else {
            return nil
        }
        
        let afterIndex = vcIndex + 1
        
        guard viewControllerList.count != afterIndex else {
            return nil
        }
        
        guard viewControllerList.count > afterIndex else {
            return nil
        }
        
        return viewControllerList[afterIndex]
    }
    // Page After End
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        self.dataSource = self
        
        if let firstViewController = viewControllerList.first {
            self.setViewControllers([firstViewController], direction: .forward, animated: true, completion: nil)
        
    }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }


}

