//
//  MyPasteViewController.swift
//  WWDC
//
//  Created by bytedance on 2022/8/22.
//

import UIKit
import UniformTypeIdentifiers

class MyPasteViewController: UIViewController {

    let pasteBoard = UIPasteboard.general
    var preview : PreviewPasteboard?
    override func viewDidLoad() {
        view.addSubview(textField)
        view.addSubview(imageViewForCopy)
        view.addSubview(imageViewForPaste)
        view.addSubview(button_img)
        view.addSubview(button_text)

        preview = PreviewPasteboard(context:self)

        view.addSubview(preview!)
        view.addSubview(pasteControl)
        view.addSubview(label)
        


    }
    

    
    lazy var textField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 30, y: 100, width: 200, height: 50))
        
        textField.borderStyle = .roundedRect
                
        return textField
    }()
    
    
    lazy var label: UILabel = {
        let label = UILabel(frame: CGRect(x: 30, y: 180, width: 200, height: 50))
        label.backgroundColor = .systemBlue
        label.textColor = .white
        label.textAlignment = .center
        
        return label
    }()
    
    lazy var imageViewForCopy: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 30, y: 280, width: 200, height: 200))
        
        imageView.image = UIImage(named: "01.jpg")
        
        return imageView
    }()
    
    lazy var button_img: UIButton = {
        
        let button = UIButton(frame: CGRect(x: 280, y: 320, width: 100, height: 50))
        button.backgroundColor = .systemPink
        button.setTitle("Copy Image", for: .normal)
        button.addTarget(self, action: #selector(copyImgToPasteBoard), for: .touchUpInside)
        return button
    }()
    
    lazy var button_text: UIButton = {
        
        let button = UIButton(frame: CGRect(x: 280, y: 220, width: 100, height: 50))
        button.backgroundColor = .systemPink
        button.setTitle("Copy Text", for: .normal)
        button.addTarget(self, action: #selector(copyTextToPasteBoard), for: .touchUpInside)
        return button
    }()
    
    var imageViewForPaste: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 30, y: 520, width: 200, height: 200))
        
        imageView.backgroundColor = .systemGray
        return imageView
    }()
    
    lazy var pasteControl: UIPasteControl = {
        
        let config = UIPasteControl.Configuration()
        
        config.displayMode = .labelOnly
        config.cornerStyle = .small
        
        config.baseBackgroundColor = .white
        
        config.baseForegroundColor = .lightGray
        
        let pasteControl = UIPasteControl(configuration: config)
        
        
        pasteControl.frame = CGRect(x: 250, y: 500, width: 300, height: 200)
        
        pasteControl.target = preview
        
        pasteControl.backgroundColor = .white
        return pasteControl
    }()
    
   
    @objc
    private func copyImgToPasteBoard(){

        pasteBoard.image = UIImage(named: "01.jpg")
    }
    
    @objc
    private func copyTextToPasteBoard(){

        pasteBoard.string = textField.text
    }
}

class PreviewPasteboard: UIView {
    
    static let supportedUTType: [UTType] = [.image, .text]
    
    var context :MyPasteViewController?
    
    init(context:MyPasteViewController?) {
        self.context = context
        super.init(frame: CGRect(x: 50, y: 520, width: 50, height: 50))
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    override
    func canPaste(_ itemProviders: [NSItemProvider]) -> Bool {
        return itemProviders
            .filter { item in
                var result = false
                PreviewPasteboard.supportedUTType.forEach { t in
                    result = item.hasItemConformingToTypeIdentifier(t.identifier) || result
                }
                return result
            }
            .count > 0
    }
    
    func setText(text:String)async{
//        print(image.size)
        self.context!.label.text = text
    }

    func setImage(image:UIImage)async{
        print(image.size)
        self.context!.imageViewForPaste.image = image
    }
    
    override
    func paste(itemProviders: [NSItemProvider]) {
        for item in itemProviders {
            PreviewPasteboard.supportedUTType.forEach { type in
                if item.hasItemConformingToTypeIdentifier(type.identifier) {
                    print("dididi \(type.identifier)")
                    if type == .image {
                        item.loadDataRepresentation(for: type, completionHandler: { data, error in
                            if error != nil {
                                print("dididi \(error)")
                            } else if let `data` = data {
                                let image = UIImage(data: data)
                                print("dididi \(image?.size)")
                                Task{
                                    await self.setImage(image:image!)
                                }
                            }
                        })
                    } else if type == .text {
                        item.loadDataRepresentation(for: type) { data, error in
                            if error != nil {
                                print("dididi \(error)")
                            } else if let `data` = data {
                                print(data)
                                let str = String(data: data, encoding: .utf8)
                                print("dididi \(str)")
                                Task{
                                    await self.setText(text:str ?? "nil")
                                }
                            }
                        }
                    }
                    return
                }
            }
        }
    }
}
