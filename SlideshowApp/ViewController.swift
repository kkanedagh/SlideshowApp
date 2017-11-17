//
//  ViewController.swift
//  SlideshowApp
//
//  Created by kaneda on 2017/11/13.
//  Copyright © 2017年 kkanedagh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
        
    // 画像の名前の配列
    let imageNameArray = [
        "abura1.jpg",
        "abura2.jpg",
        "abura3.jpg",
        "sp1.jpg",
        ]
    
    // 表示している画像の配列番号
    var dispImageNo = 0
    
    // 表示していた画像の配列番号
    var pastDispImageNo = 0
    
    // ボタンの再生停止
    var isPlay = false
    
    var timer: Timer!
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var prevButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var slide: UIButton!
    
    @IBAction func onSlide(_ sender: Any) {

        if self.isPlay {
            //ボタンを押したときに文字列を変更
            slide.setTitle("再生", for: .normal)
            
            //スライドショー停止
            self.timer.invalidate()
            
            self.isPlay = false
            
            //ボタン有効
            prevButton.isEnabled = true
            nextButton.isEnabled = true
            
        } else {
            //ボタンを押したときに文字列を変更
            slide.setTitle("停止", for: .normal)
            
            //2秒ごとにupdateSlideを実行
            self.timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(updateSlide), userInfo: nil, repeats: true)
            
            self.isPlay = true
            
            //ボタン無効
            prevButton.isEnabled = false
            nextButton.isEnabled = false
        }
    }
    
    //ImageViewの画像をtapした場合の処理
    @IBAction func onTapImage(_ sender: Any) {
        
        // KakudaiViewControllerへ遷移するSegueを呼び出す
        performSegue(withIdentifier: "showKakudaiView",sender: nil)
    }
    
    
    @IBAction func onPrev(_ sender: Any) {
        
        // 配列番号を1減らす
        self.dispImageNo -= 1
        
        // 配列番号を元に画像を表示する
        displayImage()
    }

    @IBAction func onNext(_ sender: Any) {
        
        // 配列番号を1増やす
        self.dispImageNo += 1
        
        // 配列番号を元に画像を表示する
        displayImage()
    }
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
        // 他の画面から segue を使って戻ってきた時に呼ばれる
        
        //画面遷移する前に表示していた画像を上書き
        //self.dispImageNo = self.pastDispImageNo
        
        //スライドショーを開始する
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //初期読み込み画像
        let image = UIImage(named: "abura1.jpg")
        imageView.image = image
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // segueから遷移先のResultViewControllerを取得する
        let kakudaiViewController:KakudaiViewController = segue.destination as! KakudaiViewController
        
        // 遷移先のKakudaiViewControllerで宣言しているimageに値を代入して渡す
        kakudaiViewController.imagePass = self.imageNameArray[self.dispImageNo]
        
        //self.pastDispImageNo = self.dispImageNo
        
        //スライドショーを一時停止する
    }
    
    //配列番号を元に画像を表示する
    func displayImage() {
        
        //正常範囲チェック
        // 範囲より下を指している場合、最後の画像を表示
        if self.dispImageNo < 0 {
            self.dispImageNo = self.imageNameArray.count - 1
        }
        
        // 範囲より上を指している場合、最初の画像を表示
        if self.dispImageNo > self.imageNameArray.count - 1 {
            self.dispImageNo = 0
        }
        
        // 表示している画像の番号から名前を取り出し
        let name = self.imageNameArray[self.dispImageNo]
        
        // 画像を読み込み
        let image = UIImage(named: name)
        
        // Image Viewに読み込んだ画像をセット
        imageView.image = image
    }

    // スライドショー
    func updateSlide() {
        
        // 配列番号を1増やす
        self.dispImageNo += 1
        
        // 配列番号を元に画像を表示する
        displayImage()
    }

}

