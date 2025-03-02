//
//  MainViewController.swift
//  PickColor
//
//  Created by Denis Lachikhin on 17.02.2025.
//

import UIKit

class ColorPickerViewController: UIViewController {
// MARK: - IB Outlets
    @IBOutlet var colorView: UIView!
    
    @IBOutlet var redLabel: UILabel!
    @IBOutlet var greenLabel: UILabel!
    @IBOutlet var blueLabel: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
// MARK: - Public Properties
    weak var delegate: ColorPickerVCDelegate?
    
    var viewColor: UIColor!
    
// MARK: - View Life Cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorView.layer.cornerRadius = 15
        setSliders(From: viewColor)
        setColor()
        redLabel.text = string(from: redSlider)
        greenLabel.text = string(from: greenSlider)
        blueLabel.text = string(from: blueSlider)
    }
    
// MARK: - IB Actions
    @IBAction private func pickColor(_ sender: UISlider) {
        setColor()
        
        switch sender {
        case redSlider:
            redLabel.text = string(from: redSlider)
        case greenSlider:
            greenLabel.text = string(from: greenSlider)
        default:
            blueLabel.text = string(from: blueSlider)
        }
    }
    @IBAction func doneDidTapped() {
        delegate?.getViewColor(colorView)
        dismiss(animated: true)
    }
    
    // MARK: - Private Methods
    private func setColor() {
        colorView.backgroundColor = UIColor(
            red: redSlider.value.cgFloat(),
            green: greenSlider.value.cgFloat(),
            blue: blueSlider.value.cgFloat(),
            alpha: 1
        )
    }
    private func string(from slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }
    private func setSliders(From color: UIColor) {
        redSlider.value = color.components.red
        greenSlider.value = color.components.green
        blueSlider.value = color.components.blue
    }
}

// MARK: - Float
extension Float {
    func cgFloat() -> CGFloat {
        CGFloat(self)
    }
}
// MARK: - UIColor
 extension UIColor {
    var color: CIColor {
        CIColor(color: self)
    }
    var components: (
        red: Float,
        green: Float,
        blue: Float,
        alpha: Float
    ) {
        let color = self.color
        return (
            Float(color.red),
            Float(color.green),
            Float(color.blue),
            Float(color.alpha)
        )
    }
}
