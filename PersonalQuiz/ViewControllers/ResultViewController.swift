//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by brubru on 18.08.2022.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet var typeResultLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    
    var answers: [Answer]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let animalResult = findFrequentAnimal()
        updateUI(with: animalResult)
        navigationItem.hidesBackButton = true
    }
    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
        
    }
    
    private func findFrequentAnimal() -> AnimalType {
        var animalAnswerCounts: [AnimalType : Int] = [:]
        let animalTypes = answers.map { $0.type }

        for animalType in animalTypes {
            animalAnswerCounts[animalType] = (animalAnswerCounts[animalType] ?? 0) + 1
        }

        let mostCommonAnimal = animalAnswerCounts.max { $0.1 < $1.1 }?.key ?? .cat
        
        return mostCommonAnimal
        
    }
    
    private func updateUI(with animal: AnimalType) {
        typeResultLabel.text = "Да вы же - \(animal.rawValue)!"
        descriptionLabel.text = animal.definition

    }
}
