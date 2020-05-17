import SceneKit

public class Debug {
    public static func generateGuides(size: CGFloat, scene: SCNScene) {
        for i in 0...1 {
            for j in 0...1 {
                for k in 0...1 {
                    let debugBox = SCNBox(width: size,
                                          height: size,
                                          length: size,
                                          chamferRadius: 0)
                    let debugBoxNode = SCNNode(geometry: debugBox)
                    let pos = SCNVector3(CGFloat(i*2-1)/2,
                                         CGFloat(j*2-1)/2,
                                         CGFloat(k*2-1)/2)
                    let color = UIColor(red: CGFloat(i),
                                        green: CGFloat(j),
                                        blue: CGFloat(k),
                                        alpha: 1)
                    debugBoxNode.position = pos
                    debugBox.firstMaterial?.diffuse.contents = color
                    scene.rootNode.addChildNode(debugBoxNode)
                }
            }
        }
        let sphere = SCNSphere(radius: size)
        let sphereNode = SCNNode(geometry: sphere)
        sphere.firstMaterial?.diffuse.contents = UIColor.systemGray
        scene.rootNode.addChildNode(sphereNode)
    }

}
