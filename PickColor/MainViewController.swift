//
//  MainViewController.swift
//  PickColor
//
//  Created by Denis Lachikhin on 02.03.2025.
//

import UIKit


/// Берём цвет с UIView
protocol ColorPickerVCDelegate: AnyObject {
    
    /// Присваиваем экрану цвет с экрана настроек
    /// - Parameter color: Цвет экрана настроек
    func getViewColor(_ color: UIView)
}

final class MainViewController: UIViewController {
    var viewColor = UIColor.white
    // MARK: - View Life Cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = viewColor
    }
    
// MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let colorPickerVC = segue.destination as? ColorPickerViewController
        colorPickerVC?.viewColor = viewColor
        colorPickerVC?.delegate = self
    }
}

// MARK: - Main View Controller
extension MainViewController: ColorPickerVCDelegate {
    func getViewColor(_ color: UIView ) {
        view.backgroundColor = color.backgroundColor
        viewColor = color.backgroundColor ?? UIColor.white
    }
}
