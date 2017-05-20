//
//  ViewController.swift
//  ActionCableSample
//
//  Created by Yusuke Ariyoshi on 2017/05/20.
//  Copyright © 2017年 Yusuke Ariyoshi. All rights reserved.
//

import UIKit
import NetworkExtension
import SystemConfiguration.CaptiveNetwork
import ActionCableClient

class ViewController: UIViewController {
    
    @IBOutlet weak var receivedBodyLabel: UILabel!
    
    var client: ActionCableClient!
    var roomChannel: Channel?
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.client = ActionCableClient(url: URL(string: "ws://localhost:3000/cable")!)
        client.connect()
        
        client.onConnected = {
            print("Connected!")
            
            self.roomChannel = self.client.create("RoomChannel")
            if let roomChannel = self.roomChannel {
                roomChannel.onReceive = { (JSON : Any?, error : Error?) in
                    // receive message
                    if let json = JSON {
                        print("Received: ", json)
                        self.receivedBodyLabel.text = (json as! NSDictionary)["message"] as? String
                    }
                    if let error = error {
                        print("Received: ", error)
                    }
                }
                
                roomChannel.onSubscribed = {
                    print("Subscribed")
                }
                
                roomChannel.onUnsubscribed = {
                    print("Unsubscribed")
                }
                
                roomChannel.onRejected = {
                    print("Rejected")
                }
            }
        }
        
        client.onDisconnected = {(error: Error?) in
            print("Disconnected!")
        }
    }
    
    @IBAction func didTapSendButton(_ sender: Any) {
        guard let roomChannel = roomChannel else { return }
        // send message
        let random = arc4random() % 10
        if let error = roomChannel["speak"](["message": "hello: " + String(random)]) {
            print("Error: ", error)
        }
    }
}
