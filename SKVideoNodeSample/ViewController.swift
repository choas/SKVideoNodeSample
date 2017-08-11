//
//  ViewController.swift
//  SKVideoNodeSample
//
//  Created by 吉田麗央 on 2015/02/07.
//  Copyright (c) 2015年 Reo Yoshida. All rights reserved.
//

import UIKit
import SpriteKit
import AVFoundation

class ViewController: UIViewController {
    
    var playerItem:AVPlayerItem?
    var player:AVPlayer?
    var videoNode:SKVideoNode?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let view = self.view as! SKView
        
        let scene = SKScene(size: self.view.frame.size)
        view.presentScene(scene)
        
        let urlStr = Bundle.main.path(forResource: "sample", ofType: "mp4")
        let url = NSURL(fileURLWithPath: urlStr!)
        
        let asset = AVURLAsset(url: url as URL, options: nil)
        playerItem = AVPlayerItem(asset: asset)
        player = AVPlayer(playerItem: playerItem)
        
        videoNode = SKVideoNode(avPlayer: player!)
        
        // initialize with NSURL
//        videoNode = SKVideoNode(videoURL: url!)
        
        // initialize with VideoFileName
//        videoNode = SKVideoNode(videoFileNamed: "sample.mp4")
        videoNode?.position = CGPoint(x: scene.size.width/2, y: scene.size.height/2)
        
        scene.addChild(videoNode!)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        videoNode?.play()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
