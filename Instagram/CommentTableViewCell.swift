//
//  CommentTableViewCell.swift
//  Instagram
//
//  Created by Kisoshi on 2018/06/05.
//  Copyright © 2018年 masayoshi.yamamoto. All rights reserved.
//

import UIKit

class CommentTableViewCell: UITableViewCell {
    
    @IBOutlet weak var commentLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
         print("DEBUG_PRINT: CommentTableViewCell override func")
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setPostData(_ postData: PostData) {
        
        self.commentLabel.text = "\(postData.name!) : \(postData.comment!)"
        print (" comment is \(postData.comment!)")
    }
    
}
