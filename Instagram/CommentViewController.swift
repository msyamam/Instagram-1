//
//  CommentViewController.swift
//  Instagram
//
//  Created by Kisoshi on 2018/05/31.
//  Copyright © 2018年 masayoshi.yamamoto. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase

class CommentViewController: UIViewController {
    
    // HomeViewControllerからidを受け取る為の変数を定義
    var passedID: String!
    
    @IBOutlet weak var commentInput: UITextView!
    
    @IBAction func backToHome(_ sender: Any) {
        
        let time = Date.timeIntervalSinceReferenceDate
        
        // 辞書を作成してコメントと時間を更新する
        let postRef = Database.database().reference().child(Const.PostPath).child(passedID!)
        let comment = ["comment": commentInput.text!, "time": String(time)]
        postRef.updateChildValues(comment)
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  }

