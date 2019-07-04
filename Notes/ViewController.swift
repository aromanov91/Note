//
//  ViewController.swift
//  Notes
//
//  Created by Aleksandr Romanov on 02/07/2019.
//  Copyright © 2019 Aleksandr Romanov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // Создаем баннер
    private let baseApp: UIView = {
        let baseApp = UIView()
        baseApp.translatesAutoresizingMaskIntoConstraints = false
        baseApp.backgroundColor = UIColor.red
        return baseApp
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Выборо заголовка в зависимости от платной и бесплатной версии
        if isFreeVersion {
            self.title = "Бесплатая версия"
        } else {
            self.title = "Платная версия"
        }
        
        // Загружается красный баннер на бесплатной версии
        if isFreeVersion {
            view.addSubview(baseApp)
            createBaseAppConstraint()
        }
        
    }
    
    // Констрейнты для баннера
    private func createBaseAppConstraint() {
        baseApp.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        baseApp.heightAnchor.constraint(equalToConstant: 100).isActive = true
        baseApp.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        baseApp.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
    }

    


}

