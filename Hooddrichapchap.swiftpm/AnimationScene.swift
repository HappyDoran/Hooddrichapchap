//
//  AnimationScene.swift
//  Hooddrichapchap
//
//  Created by Doran on 3/22/24.
//

import Foundation
import SpriteKit
import SwiftUI

class GameScene: SKScene {
    //    let fColor: UIColor
    
    //    init(fColor: UIColor) {
    //        self.fColor = fColor
    //        super.init(size: .zero)
    //    }
    
    //    required init?(coder aDecoder: NSCoder) {
    //        fatalError("init(coder:) has not been implemented")
    //    }
    
    override func didMove(to view: SKView) {
        self.backgroundColor = .white
        physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
    }
    
    func addBox(at location: CGPoint, imageName: String) {
        let box = SKSpriteNode(imageNamed: imageName)
        box.position = location
        box.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 50, height: 50))
        addChild(box)
        
        let fadeIn = SKAction.fadeIn(withDuration: 0)
        let fadeOut = SKAction.fadeOut(withDuration: 1.5)
        let remove = SKAction.removeFromParent()
        let sequence = SKAction.sequence([fadeOut, remove])
        
        box.run(sequence)
    }
    
}



class GameViewModel: ObservableObject {
    let scene: GameScene
    //    let fColor : UIColor
    
    //    init(sceneSize: CGSize, fColor : UIColor) {
    init(sceneSize: CGSize) {
        //        scene = GameScene(fColor: fColor)
        scene = GameScene()
        scene.size = sceneSize
        scene.scaleMode = .fill
        scene.zPosition = -100
        //        self.fColor = fColor
    }
    
    func dropBoxes(imageName: String) {
        for _ in 0..<10 {
            let xPosition = CGFloat.random(in: 0...scene.size.width)
            let yPosition = CGFloat.random(in: scene.size.height-50...scene.size.height)
            let randomLocation = CGPoint(x: xPosition, y: yPosition)
            scene.addBox(at: randomLocation, imageName: imageName)
        }
        //        let xPosition = CGFloat.random(in: 0...scene.size.width)
        //        let yPosition = CGFloat.random(in: scene.size.height-50...scene.size.height)
        //        let randomLocation = CGPoint(x: xPosition, y: yPosition)
        //        scene.addBox(at: randomLocation, imageName: imageName)
    }
}



