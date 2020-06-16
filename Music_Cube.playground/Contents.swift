/*:
# Hello WWDC20 Swift Student Challenge

## My name is Alex and welcome to my Playground!


 Something I really love about playing music is the act of exploring different possibilities.
 The real fun in playing an instrument begins when you start to create sound just to see (or hear) where it takes you.
 And where it takes you gives more ideas on where to go from there and so on.
 
 I tried to make a new kind of instrument. Not the most beatifully sounding one, admittedly, but perhaps somewhat interesting to the curious mind.
 
 Feel free to go play and discover things for yourself, or check for instructions bellow.

*Run the code bellow to begin...*
*/

import SceneKit
import UIKit
import PlaygroundSupport

let frame = CGRect(x: 0, y: 0, width: 400, height: 600)

var sceneView = SCNView(frame: frame)

let gameScene = GameScene(sceneView: sceneView, frame: frame)
sceneView.addSubview(gameScene)

PlaygroundPage.current.liveView = sceneView

/*:
Instructions:
- Tap on the cube's pads to select it.
- You can place either a ball or an arrow on it (clicking icons above)
- Bellow are some buttons for navigation (rotating the cube) andpreview (play/pause)
- You can either click on the rotating arrow above or click on the pad to rotate selected arrows
- Clicking the red X deletes the selected arrow
- Clicking the white X clears all objects

Rules:
- The balls follow the cube's pads until they hit an arrow
- When a ball hits an arrow, they sound a note and are redirected to that arrow's pointed direction
- The notes are associated to the big cube's face. Each face has a different note attached
- The notes follow an A pentatonic scale being (green (top): A, red (right): C, blue (front): D, pink(bottom): E, cyan(left): G, yellow(back): A)
 */
