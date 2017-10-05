//
//  SelectViewController.swift
//  ScrollView
//
//  Created by michael chan on 2017/10/4.
//  Copyright © 2017年 michael chan. All rights reserved.
//

import UIKit

class SelectViewController: UIViewController, UISplitViewControllerDelegate {
    private struct storyboard{
        static let showPicture = "show picture"
    }
    

    @IBAction func showImage(_ sender: UIButton) {
        performSegue(withIdentifier: storyboard.showPicture, sender: sender)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == storyboard.showPicture {
            if let ivc = segue.destination as? ImageViewController {
                if let btd = sender as? UIButton {
                    let image  = btd.currentTitle
                    ivc.imageURL = URL(string: Model.getUrl(nameOfPic: image!))
                    ivc.title = btd.currentTitle
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        splitViewController?.delegate = self
    }
    
    func splitViewController(_ splitViewController: UISplitViewController,
                             collapseSecondary secondaryViewController: UIViewController,
                             onto primaryViewController: UIViewController) -> Bool {
        if let a = secondaryViewController as? ImageViewController {
            if a.imageURL == nil {
                return true
            }
        }
        return false
    } 
}
