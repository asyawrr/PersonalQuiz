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
    
    // 1. Передать массив с ответами на экран с результатами
    // 2. Определить наиболее часто встречающийся тип животного
    // 3. Отобразить результаты в соотвствии с этим животным
    // 4. Избавиться от кнопки возврата назад на экране результатов
    
    var answers: [Answer]!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let animalResult = findFrequentAnimal()
        typeResultLabel.text = "Да вы же - \(animalResult.rawValue)!"
        descriptionLabel.text = animalResult.definition
        
        navigationItem.hidesBackButton = true
        print(animalResult)
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
        
        let mostCommonAnimal = animalAnswerCounts.sorted { $0.1 < $1.1 }.first!.key

        return mostCommonAnimal
        
    }
    
    
    
}
