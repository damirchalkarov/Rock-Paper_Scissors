//
//  ViewController.swift
//  RPS
//
//  Created by Damir Chalkarov on 16.09.2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var winsLabel: UILabel!
    @IBOutlet weak var winsCountLabel: UILabel!
    @IBOutlet weak var losesLabel: UILabel!
    @IBOutlet weak var losesCountLabel: UILabel!
    @IBOutlet weak var tiesLabel: UILabel!
    @IBOutlet weak var tiesCountLabel: UILabel!
    
    
    
    let images = [
        UIImage(named: "scissors"),
        UIImage(named: "scroll"),
        UIImage(named: "stone"),
    ]
    
    @IBOutlet weak var playButton: UIButton!
    
    var totalWins = 0
    var totalLoses = 0
    var totalTies = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        image1.image = UIImage(named: "scissors")
        image2.image = UIImage(named: "stone")
        
        textLabel.text = "ROCK-PAPER-SCISSORS"
        textLabel.textColor = UIColor.black
        
    }
    
    
    func getResult(playerIndex: Int, computerIndex: Int) {
        //камень(2) побеждает ножницы(0), бумага(1) побеждает камень(2), ножницы(0) побеждает бумагу(1)
        if playerIndex == computerIndex {
            totalTies += 1
            tiesCountLabel.text = "\(totalTies)"
        } else if (playerIndex == 2 && computerIndex == 0) || (playerIndex == 1 && computerIndex == 2) || (playerIndex == 0 && computerIndex == 1) {
            totalWins += 1
            winsCountLabel.text = "\(totalWins)"
        } else {
            totalLoses += 1
            losesCountLabel.text = "\(totalLoses)"
        }

    }
    
    @IBAction func playButtonTapped(_ sender: Any) {
        let first = randomImageIndex()
        let second = randomImageIndex()
        
        image1.image = images[first]
        image2.image = images[second]
        
        getResult(playerIndex: first, computerIndex: second)
        
    }
    
    @IBAction func resetButtonTapped(_ sender: Any) {
        totalTies = 0
        tiesCountLabel.text = "0"
        totalWins = 0
        winsCountLabel.text = "0"
        totalLoses = 0
        losesCountLabel.text = "0"
        
    }
    func randomImageIndex() -> Int {
        return Int.random(in: 0..<images.count)
    }

}

