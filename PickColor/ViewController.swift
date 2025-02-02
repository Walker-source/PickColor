//
//  ViewController.swift
//  PickColor
//
//  Created by Denis Lachikhin on 02.02.2025.
//

import UIKit

final class ViewController: UIViewController {
//    MARK: - IB Outlets
    @IBOutlet private var colorView: UIView!

    @IBOutlet private var redSlider: UISlider!
    @IBOutlet private var greenSlider: UISlider!
    @IBOutlet private var blueSlider: UISlider!
    
    @IBOutlet private var redValueLabel: UILabel!
    @IBOutlet private var greenValueLabel: UILabel!
    @IBOutlet private var blueValueLabel: UILabel!
    
//    MARK: - View Life Cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorView.layer.cornerRadius = 10
        
        colorView.backgroundColor = .init(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1.0
        )
        
        redValueLabel.text = String(redSlider.value)
        greenValueLabel.text = String(greenSlider.value)
        blueValueLabel.text = String(blueSlider.value)
    }
    
//    MARK: - IB Actions
    @IBAction private func redSliderAction() {
        redValueLabel.text = String(format: "%.2f", redSlider.value)
        colorViewChange()
    }
    @IBAction private func greenSliderAction() {
        greenValueLabel.text = String(format: "%.2f", greenSlider.value)
        colorViewChange()
    }
    @IBAction private func blueSliderAction() {
        blueValueLabel.text = String(format: "%.2f", blueSlider.value)
        colorViewChange()
    }
    
//    MARK: - ColorViewChange method
    private func colorViewChange() {
        colorView.backgroundColor = .init(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: 1.0)
    }
}


