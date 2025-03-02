//
//  MainViewController.swift
//  PickColor
//
//  Created by Denis Lachikhin on 02.03.2025.
//

import UIKit

/// Берём цвет с UIView
protocol ColorPickerVCDelegate: AnyObject {
    
    /// Берём  цвет с экрана настроек
    /// - Parameter color: Цвет экрана настроек
    func getViewColor(_ color: UIView)
}

final class MainViewController: UIViewController {
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let colorPickerVC = segue.destination as? ColorPickerViewController
        
        colorPickerVC?.viewColor = view.backgroundColor
        colorPickerVC?.delegate = self
    }
}

// MARK: - Main View Controller
extension MainViewController: ColorPickerVCDelegate {
    func getViewColor(_ color: UIView ) {
        view.backgroundColor = color.backgroundColor
    }
}
