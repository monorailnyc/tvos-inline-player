//
//  ViewController.swift
//  inline-player
//
//  Created by Joshua C. Lerner on 2/4/17.
//  Copyright © 2017 Monorail. All rights reserved.
//

import UIKit
import AVKit

class ViewController: UIViewController {
    @IBOutlet weak var inlineView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()

        let playerViewController = AVPlayerViewController()
        playerViewController.player = AVPlayer(url: URL(string: "https://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4")!)
        playerViewController.view.frame = inlineView.frame
        view.addSubview(playerViewController.view)
        addChildViewController(playerViewController)
        playerViewController.player?.play()

        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3) {
            playerViewController.removeFromParentViewController()
            self.present(playerViewController, animated: true, completion: nil)
        }

        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 6) {
            playerViewController.dismiss(animated: true, completion: {
                self.addChildViewController(playerViewController)
                self.view.addSubview(playerViewController.view)
            })
        }
    }
}
