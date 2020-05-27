//
//  RaitingControl.swift
//  My plases
//
//  Created by liza on 11/11/2019.
//  Copyright © 2019 liza. All rights reserved.
//

import UIKit

@IBDesignable class RaitingControl: UIStackView {
    
    // MARK: Properties
    var raiting = 0 {
        didSet {
            updateButtonSelectionState()
        }
    }
    
    private var raitingButtons = [UIButton]()
    
    @IBInspectable var starSize: CGSize = CGSize(width: 44.0, height: 44.0) {
        didSet {
            setupButtons()
        }
    }
    @IBInspectable var starCount: Int = 5 {
        didSet {
//            starSize = self.updatedStarSize
            setupButtons()
        }
    }
    
    
    
    // MARK: Inicialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButtons()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        setupButtons()
    }
    //MARK: Button Action
    
    @objc func ratingButtonTapped(button: UIButton){
        guard let index = raitingButtons.firstIndex(of: button) else { return }
        
        // Calculate the raiting of the selected button
        let selectedRaiting = index + 1
        
        if selectedRaiting == raiting {
            raiting = 0
        } else {
            raiting = selectedRaiting
        }
    }
    
    
    //MARK: Private Methods
    
    private var updatedStarSize: CGSize {
        let width: CGFloat = bounds.maxX / CGFloat(starCount) - spacing * CGFloat(min(0 , starCount - 1))
        let height: CGFloat = bounds.maxY
        let value = min(width, height)
        let size = CGSize(width: value, height: value)
        if self.starSize.width <= size.width {
            return self.starSize
        }
        return size
    }
    
    private func setupButtons(){
        
        for button in raitingButtons {
            removeArrangedSubview(button)
            button.removeFromSuperview()
        }
        raitingButtons.removeAll()
        
        // Load button image
        let bundle = Bundle(for: type(of: self))
        
        let filledStar = UIImage(named: "filledStar", in: bundle, compatibleWith: self.traitCollection)
        let emptyStar = UIImage(named: "emptyStar", in: bundle, compatibleWith: self.traitCollection)
        let highlightedStar = UIImage(named: "highlightedStar", in: bundle, compatibleWith: self.traitCollection)
        
        for _ in 0 ..< starCount {
            
            //Create the button
            let button = UIButton()
            
            // Set the button image
            button.setImage(emptyStar, for: .normal)
            button.setImage(filledStar, for: .selected)
            button.setImage(highlightedStar, for: .highlighted)
            button.setImage(highlightedStar, for:[.highlighted, .selected])
            
            //ADD constraints
            button.translatesAutoresizingMaskIntoConstraints = false
            button.heightAnchor.constraint(equalToConstant: starSize.height).isActive = true
            button.widthAnchor.constraint(equalToConstant: starSize.width).isActive = true
                        
            //Setup the button action
            button.addTarget(self, action: #selector(ratingButtonTapped(button:)), for: .touchUpInside)
            
            //ADD the button to the stack
            addArrangedSubview(button)
            
            // Add to array
            raitingButtons.append(button)
        }
        updateButtonSelectionState()
    }
    
    private func updateButtonSelectionState() {
        for (index, button) in raitingButtons.enumerated() {
            button.isSelected = index < raiting
        }
    }
}
