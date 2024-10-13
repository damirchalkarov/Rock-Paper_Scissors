//
//  ManualViewController.swift
//  RPS
//
//  Created by Damir Chalkarov on 02.10.2024.
//

import Foundation
import UIKit

class ManualViewController: UIViewController {
    
    @IBOutlet weak var rpsLabel: UILabel!
    @IBOutlet weak var winsLabel: UILabel!
    @IBOutlet weak var winsCountLabel: UILabel!
    @IBOutlet weak var losesLabel: UILabel!
    @IBOutlet weak var losesCountLabel: UILabel!
    @IBOutlet weak var tiesLabel: UILabel!
    @IBOutlet weak var tiesCountLabel: UILabel!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var image3: UIImageView!
    @IBOutlet weak var playerImage: UIImageView!
    @IBOutlet weak var compImage: UIImageView!
    @IBOutlet weak var rockButton: UIButton!
    @IBOutlet weak var paperButton: UIButton!
    @IBOutlet weak var scissorsButton: UIButton!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var image4: UIImageView!
    
    @IBOutlet var usersImage: UIImageView!
    
    @IBOutlet var compsImage: UIImageView!
    
    
    
    var firstValue: Int?
    var secondValue: Int?
    
    
    let images = [
        UIImage(named: "scissors"),
        UIImage(named: "scroll"),
        UIImage(named: "stone"),
    ]
    
    var totalWins = 0
    var totalLoses = 0
    var totalTies = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        playerImage.image = UIImage(named: "user")
        compImage.image = UIImage(named: "robot")
        
        image1.image = UIImage(named: "stone")
        image1.isHidden = true
        image2.image = UIImage(named: "scroll")
        image2.isHidden = true
        image3.image = UIImage(named: "scissors")
        image3.isHidden = true
        usersImage.image = images[0]
        
        
        
        
    }
    
    @IBAction func rockButtonTapped(_ sender: Any) {
        let rockButton = 2
        secondValue = rockButton
        image1.isHidden = false
        image2.isHidden = true
        image3.isHidden = true
        playButton.isHidden = false
        compareValues()
        firstValue = nil
        secondValue = nil
        if let number1 = firstValue {
            usersImage.image = UIImage(named: "stone")
            compsImage.image = images[number1]
        }
        
        
        
        UIView.animate(withDuration: 0.4, delay: .zero) {
            let transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
            let moveTransform = CGAffineTransform(translationX: 0, y: -20)
            self.image1.transform = transform.concatenating(moveTransform)
        } completion: { _ in
            UIView.animate(withDuration: 0.4) {
                self.image1.transform = .identity
                
            }
        }

    }
    @IBAction func paperButtonTapped(_ sender: Any) {
        let paperButton = 1
        secondValue = paperButton
        image1.isHidden = true
        image2.isHidden = false
        image3.isHidden = true
        playButton.isHidden = false
        compareValues()
        firstValue = nil
        secondValue = nil
        if let number1 = firstValue {
            usersImage.image = UIImage(named: "scroll")
            compsImage.image = images[number1]
        }
        
        
        UIView.animate(withDuration: 0.4, delay: .zero) {
            let transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
            let moveTransform = CGAffineTransform(translationX: 0, y: -20)
            self.image2.transform = transform.concatenating(moveTransform)
        } completion: { _ in
            UIView.animate(withDuration: 0.4) {
                self.image2.transform = .identity
                
            }
        }
        
        
    }
    @IBAction func scissorsButtonTapped(_ sender: Any) {
        let scissorsButton = 0
        secondValue = scissorsButton
        image1.isHidden = true
        image2.isHidden = true
        image3.isHidden = false
        playButton.isHidden = false
        compareValues()
        firstValue = nil
        secondValue = nil
        if let number1 = firstValue {
            usersImage.image = UIImage(named: "scissors")
            compsImage.image = images[number1]
        }
        
        UIView.animate(withDuration: 0.4, delay: .zero) {
            let transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
            let moveTransform = CGAffineTransform(translationX: 0, y: -20)
            self.image3.transform = transform.concatenating(moveTransform)
        } completion: { _ in
            UIView.animate(withDuration: 0.4) {
                self.image3.transform = .identity
                
            }
        }
    }
    
    @IBAction func playButtonTapped(_ sender: Any) {
        
        let robotChoice = randomImageIndex()
        firstValue = robotChoice
        
        image1.isHidden = false
        image2.isHidden = false
        image3.isHidden = false
        playButton.isHidden = true
        resultLabel.text = ""
        
        compareValues()
        
        
    }
    
    func compareValues() {
            if let first = firstValue, let second = secondValue {
                if first == second {
                    totalTies += 1
                    tiesCountLabel.text = "\(totalTies)"
                    resultLabel.text = "It's a tie!"
                } else if (first == 0 && second == 2) || (first == 2 && second == 1) || (first == 1 && second == 0) {
                    totalWins += 1
                    winsCountLabel.text = "\(totalWins)"
                    resultLabel.text = "You win!"
                } else {
                    totalLoses += 1
                    losesCountLabel.text = "\(totalLoses)"
                    resultLabel.text = "You lose!"
                }
            }
        }
    
    
    @IBAction func resetButtonTapped(_ sender: Any) {
        totalTies = 0
        tiesCountLabel.text = "0"
        totalWins = 0
        winsCountLabel.text = "0"
        totalLoses = 0
        losesCountLabel.text = "0"
        resultLabel.text = ""
    }
    
    func randomImageIndex() -> Int {
        return Int.random(in: 0..<images.count)
    }
    
    
    
    
}
