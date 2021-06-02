//
//  InputTextView.swift
//  InstagramMVVM3
//
//  Created by Mayuresh Rao on 6/1/21.
//

import UIKit

class InputTextView: UITextView {
    
    //MARK: Properties
    var placeholderText: String? {
        didSet { placeholderLabel.text = placeholderText }
    }
    
    private let placeholderLabel: UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        return label
    }()
    
    //MARK: Lifecycle
    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        
        addSubview(placeholderLabel)
        placeholderLabel.anchor(top: topAnchor,
                                left: leftAnchor,
                                paddingTop: 6,
                                paddingLeft: 8)
        NotificationCenter.default.addObserver(self, selector: #selector(handleDidTextChange), name: UITextView.textDidChangeNotification, object: nil)
    }
    
    //MARK: Actions
    @objc func handleDidTextChange(){
        placeholderLabel.isHidden = !text.isEmpty
    }
    

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}


