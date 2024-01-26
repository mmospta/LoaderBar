//
//  ViewController.swift
//  LoaderBar
//
//  Created by MM on 25/1/2567 BE.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var loaderView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let loader = LoaderBarView(frame: loaderView.bounds, multiplyBarWidthPercent: 0.8, duration: 4, barColor: .blue, bgColor: .red)
//        let loader = LoaderBarView(frame: loaderView.bounds)
        loaderView.addSubview(loader)
        
    }
}

