//
//  GameScene.swift
//  FlappyTest
//
//  Created by Y on 25.12.2020.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    var backgroundNode: SKNode!
    var birdNode: SKSpriteNode!
    var lenanobirdLabel: SKLabelNode!
    
    
    override func didMove(to view: SKView) {
        
        backgroundNode = self.childNode(withName: "background")!
        birdNode = (self.childNode(withName: "bird") as! SKSpriteNode)
        lenanobirdLabel = (self.childNode(withName: "lenanobirdLabel") as! SKLabelNode)
        
        lenanobirdLabel.alpha = 0
        
        self.physicsWorld.contactDelegate = self
        
        
        let moveBackground = SKAction.move(by: CGVector(dx: -1000, dy: 0), duration: 5)
    
        backgroundNode.run(moveBackground)
    
    }
    
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        birdNode.physicsBody!.applyImpulse(CGVector(dx:0, dy:3))
        
    }
    
    func stopGame() {
        backgroundNode.removeAllActions()
        birdNode.physicsBody!.pinned = true
        lenanobirdLabel.run(SKAction.fadeIn(withDuration: 0.5))
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        stopGame()
    }
    
    
}
