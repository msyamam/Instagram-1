//
//  PostTableViewCell.swift
//  Instagram
//
//  Created by Kisoshi on 2018/05/29.
//  Copyright © 2018年 masayoshi.yamamoto. All rights reserved.
//

import UIKit

class PostTableViewCell: UITableViewCell, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var likeLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var captionLabel: UILabel!
    @IBOutlet weak var commentButton: UIButton!
    @IBOutlet weak var commentTable: UITableView!
    
      var postArray: [PostData] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        commentTable.delegate = self
        commentTable.dataSource = self
        
        print("DEBUG_PRINT: PostTableViewCell overridefunc")
        
        commentTable.allowsSelection = false
        
        let nib = UINib(nibName: "CommentableViewCell", bundle: nil)
        commentTable.register(nib, forCellReuseIdentifier: "commentCell")
        
        
        // テーブル行の高さをAutoLayoutで自動調整する
        commentTable.rowHeight = UITableViewAutomaticDimension
        // テーブル行の高さの概算値を設定しておく
        // 高さ概算値
        commentTable.estimatedRowHeight = UIScreen.main.bounds.width + 100
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        print("DEBUG_PRINT: commentTable numberOfSections")
        return 1;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // セルを取得してデータを設定する
        print("DEBUG_PRINT: commentTable func-2")
        let commentCell = commentTable.dequeueReusableCell(withIdentifier: "commentCell", for: indexPath) as! CommentTableViewCell
        commentCell.setPostData(postArray[indexPath.row])
        return commentCell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("DEBUG_PRINT: commentTable func-1")
        print("DEBUG_PRINT: Row count is \(postArray.count)")
        return postArray.count
        
    }
    
    
    func setPostData(_ postData: PostData) {
        print("DEBUG_PRINT: seTPostData")
        self.postImageView.image = postData.image
        
        self.captionLabel.text = "\(postData.name!) : \(postData.caption!)"
        //self.commentLabel.text = "\(postData.name!) : \(postData.comment!)"
        let likeNumber = postData.likes.count
        likeLabel.text = "\(likeNumber)"
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm"
        let dateString = formatter.string(from: postData.date!)
        self.dateLabel.text = dateString
        
        if postData.isLiked {
            let buttonImage = UIImage(named: "like_exist")
            self.likeButton.setImage(buttonImage, for: .normal)
        } else {
            let buttonImage = UIImage(named: "like_none")
            self.likeButton.setImage(buttonImage, for: .normal)
        }
    }
}
