//
//  ViewController.swift
//  UndoManager_Example
//
//  Created by 김우성 on 2021/09/24.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - UI Object
    @IBOutlet weak var stateLabel: UILabel!
    @IBOutlet weak var colorView: UIView!
    

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // MARK: - Actions
    @IBAction func greenButtonDidtap(_ sender: UIButton) {
        changeColorAndState(.green)
    }
    
    @IBAction func purpleButtonDidtap(_ sender: UIButton) {
        changeColorAndState(.purple)
    }
    
    @IBAction func blueButtonDidTap(_ sender: UIButton) {
        changeColorAndState(.blue)
    }
    
    @IBAction func redButtonDidTap(_ sender: UIButton) {
        changeColorAndState(.red)
    }
    
    @IBAction func undoButtonDidTap(_ sender: UIButton) {
        undoManager?.undo()
        
        stateLabel.text = "Undo is called"
    }
    
    @IBAction func redoButtonDidTap(_ sender: UIButton) {
        undoManager?.redo()
        stateLabel.text = "Redo is called"
    }
    
    // MARK: - Helpers
    func changeColorAndState(_ color: UIColor) {
        let old = self.colorView.backgroundColor ?? UIColor.white
        
        // 1. 이전 색상을 undoManager에 등록
        undoManager?.registerUndo(withTarget: self, handler: { target in
            target.changeColorAndState(old)
        })
        
        // 2. 새롭게 입력받은 색상을 UIView에 입력
        colorView.backgroundColor = color
    }
}

