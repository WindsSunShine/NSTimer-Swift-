//
//  ViewController.swift
//  MusicHomeStu
//
//  Created by 张建军 on 16/8/27.
//  Copyright © 2016年 张建军. All rights reserved.
//

import UIKit



class ViewController: UIViewController {
    
    
    
    let SCREENWITH = UIScreen.mainScreen().bounds.size.width
    let SCREENHIGHT = UIScreen.mainScreen().bounds.size.height
 
    
    var Counteer = 0.0
    
    var Timer = NSTimer()
    
    var IsPlaying = false
    
    
    let timeLable = UILabel(frame:CGRectZero)
    
    let pauseBtn:UIButton = UIButton(type: .Custom)
    
    
    let resertBtn:UIButton = UIButton(type: .Custom)
    
	let playBtn:UIButton = UIButton(type: .Custom)
	
	
	override func  preferredStatusBarStyle() -> UIStatusBarStyle {
		
		return UIStatusBarStyle.LightContent
	}
	
	
	
    override func viewDidLoad() {
        super.viewDidLoad()
      // 创建lable
     self.setupLable()
		
	// 创建按钮
		
    self.setupBtn()
	
    }

	func setupLable() {
		
		timeLable.frame = CGRectMake(20, 80, SCREENWITH - 40, SCREENHIGHT * 0.1)
		
		timeLable.backgroundColor = UIColor.grayColor()
		timeLable.text = String(Counteer)
		
		self.view.addSubview(timeLable)
		
	}
	
	func setupBtn() {
		
		// 1.
		pauseBtn.frame = CGRectMake(40 + (SCREENWITH - 60)/2, SCREENHIGHT * 0.3, (SCREENWITH - 60)/2, SCREENHIGHT * 0.2)
		pauseBtn.setTitle("pause", forState: .Normal)
		pauseBtn.setTitleColor(UIColor.blueColor(), forState: .Normal)
		pauseBtn.addTarget(self, action: #selector(ViewController.pause(_:)), forControlEvents:.TouchUpInside)
		
		pauseBtn.backgroundColor = UIColor.grayColor()
		
		self.view.addSubview(pauseBtn)
		
	  // 2.
		
	 playBtn.frame = CGRectMake(20, SCREENHIGHT * 0.3, (SCREENWITH - 60)/2, SCREENHIGHT * 0.2)
	 playBtn.setTitle("play", forState: .Normal)
	 playBtn.setTitleColor(UIColor.blueColor(), forState: .Normal)
		
	 playBtn.addTarget(self, action: #selector(ViewController.play(_:)), forControlEvents: .TouchUpInside)
		
	 playBtn.backgroundColor = UIColor.grayColor()
	
	 self.view .addSubview(playBtn)
    // 3.
	
		resertBtn.frame = CGRectMake(SCREENWITH * 0.8, 20, 50, 40)
		resertBtn.setTitle("resert", forState: .Normal)
		resertBtn.setTitleColor(UIColor.blueColor(), forState: .Normal)
		resertBtn.addTarget(self, action: #selector(ViewController.reset(_:)), forControlEvents: .TouchUpInside)
		self.view .addSubview(self.resertBtn)
		
	}
	
	func pause(btn:UIButton) {
		
		playBtn.enabled = true
		pauseBtn.enabled = false
		Timer.invalidate()
		IsPlaying = false
		
	}
	
	
	func play(btn:UIButton) {
		
		if IsPlaying {
			return
		}
		
		playBtn.enabled = false
		pauseBtn.enabled = true
		Timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: #selector(ViewController.UpdateTimer), userInfo: nil, repeats: true)
		IsPlaying = true
		
		IsPlaying = true
		
		
	
	}
	
	func reset(btn:UIButton) {
		
		Timer.invalidate()
		
		IsPlaying = false
		
		Counteer = 0
		
		timeLable.text = String(Counteer)
		
		playBtn.enabled = true
		
		pauseBtn.enabled = true
		
	}
	
	
	
	func UpdateTimer() {
		
		Counteer = Counteer + 0.1
		
		timeLable.text = String(format: "%f",Counteer)
		
	}
	
	
    
   override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

