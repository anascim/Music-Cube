import SceneKit
import UIKit

public class GameScene: UIView {
    
    public var sceneView: SCNView!
    public var gameManager: GameManager!
    public weak var touchEventsResponder: TouchEventsResponder?
    
    public init(sceneView: SCNView, frame: CGRect) {
        self.sceneView = sceneView
        self.gameManager = GameManager()
        super.init(frame: frame)
        sceneView.delegate = gameManager
        sceneView.scene = gameManager.scene
        touchEventsResponder = gameManager
        sceneView.rendersContinuously = true
        sceneView.backgroundColor = UIColor(red: 0.7, green: 0.8, blue: 1, alpha: 1)
    }
    
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let hit = sceneView.hitTest(touches.first!.location(in: sceneView), options: nil)
        if hit.count == 0 {
            touchEventsResponder?.touchedNothing()
        }
        //for result in hit.first
        if let result = hit.first {
            if let pad = result.node as? PadNode {
                touchEventsResponder?.touchedPad(pad: pad)
                
            } else if let arrow = result.node as? ArrowElement {
                touchEventsResponder?.touchedPad(pad: arrow.pad)
            } else if NavArrowNames.isArrowName(result.node.name) {
                touchEventsResponder?.touchedArrows(arrowName: result.node.name!)
            } else if result.node.name == ElementIconNames.arrow.string {
                touchEventsResponder?.touchedArrowIcon()
            } else if result.node.name == ElementIconNames.arrowRotate.string {
                touchEventsResponder?.touchedArrowRotateIcon()
            } else if result.node.name == ElementIconNames.arrowDeletion.string {
                touchEventsResponder?.touchedArrowDeleteIcon()
            } else if result.node.name == ControlIconNames.play.string {
                touchEventsResponder?.touchedPlayIcon()
            } else if result.node.name == ControlIconNames.pause.string {
                touchEventsResponder?.touchedPauseIcon()
            } else if result.node.name == ControlIconNames.wipe.string {
                touchEventsResponder?.touchedWipeIcon()
            } else if result.node.name == ElementIconNames.ball.string {
                touchEventsResponder?.touchedBallIcon()
            }
        }
    }
}

