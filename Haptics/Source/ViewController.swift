//
//  ViewController.swift
//  Haptics
//
//  Created by Rui Aureliano on 08/01/2020.
//  Copyright © 2020 Rui Aureliano. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	@IBOutlet var impactFeedbackStyleControl: UISegmentedControl!
	@IBOutlet var impactFeedbackIntesityLabel: UILabel!
	@IBOutlet var impactFeedbackIntesitySlider: UISlider!

	@IBOutlet var notificationFeedbackStyleControl: UISegmentedControl!

	var feedbackGenerator: UIImpactFeedbackGenerator = UIImpactFeedbackGenerator(style: .light)
	var intensity: CGFloat = 0.5

	var selectionGenerator: UISelectionFeedbackGenerator = UISelectionFeedbackGenerator()

	var notificationGenerator: UINotificationFeedbackGenerator = UINotificationFeedbackGenerator()

	override func viewDidLoad() {
		super.viewDidLoad()
	}

	@IBAction func controlChanged(segmentedControl: UISegmentedControl) {
		if segmentedControl.selectedSegmentIndex == 0 {
			feedbackGenerator = UIImpactFeedbackGenerator(style: .light)
		} else if segmentedControl.selectedSegmentIndex == 1 {
			feedbackGenerator = UIImpactFeedbackGenerator(style: .medium)
		} else if segmentedControl.selectedSegmentIndex == 2 {
			feedbackGenerator = UIImpactFeedbackGenerator(style: .heavy)
		} else if segmentedControl.selectedSegmentIndex == 3 {
			feedbackGenerator = UIImpactFeedbackGenerator(style: .soft)
		} else if segmentedControl.selectedSegmentIndex == 4 {
			feedbackGenerator = UIImpactFeedbackGenerator(style: .rigid)
		}
		feedbackGenerator.impactOccurred(intensity: intensity)
		feedbackGenerator.prepare()
	}

	@IBAction func sliderChanged(slider: UISlider) {
		let value = CGFloat(Int(slider.value * 10)) / 10
		if intensity != value {
			intensity = value
			impactFeedbackIntesityLabel.text = "Intensity (\(intensity))"
			feedbackGenerator.impactOccurred(intensity: intensity)
			feedbackGenerator.prepare()
		}
	}

	@IBAction func buttonPressPress(button: UIButton) {
		selectionGenerator.selectionChanged()
		selectionGenerator.prepare()
	}

	@IBAction func switchPress(switch: UISwitch) {
		selectionGenerator.selectionChanged()
		selectionGenerator.prepare()
	}

	@IBAction func notificationChanged(segmentedControl: UISegmentedControl) {
		if segmentedControl.selectedSegmentIndex == 0 {
			notificationGenerator.notificationOccurred(.success)
		} else if segmentedControl.selectedSegmentIndex == 1 {
			notificationGenerator.notificationOccurred(.warning)
		} else if segmentedControl.selectedSegmentIndex == 2 {
			notificationGenerator.notificationOccurred(.error)
		}
	}
}
