//
//  KakudaiViewController.swift
//  SlideshowApp
//
//  Created by kaneda on 2017/11/13.
//  Copyright © 2017年 kkanedagh. All rights reserved.
//

import UIKit

class KakudaiViewController: UIViewController {
    
    // ViewControllerから受け取る
    var imagePass: String?
    
    @IBOutlet weak var imageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //初期読み込み画像
        let image = UIImage(named: imagePass!)
        imageView.image = image
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
