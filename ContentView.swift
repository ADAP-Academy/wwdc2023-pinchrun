import SwiftUI
import SpriteKit

struct ContentView: View {
    
    var body: some View {
        ZStack{
            MyGameView()
            VStack{
                HStack{
                    Spacer()
                    HandCameraView()
                        .frame(width: 200, height: 200)
                        .padding(.trailing, 100)
                }
                Spacer()
            }
        }
    }
}


struct HandCameraView: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> CameraViewController {
        
        // Load Main.storyboard
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        // Instantiate ViewController
        guard let CameraViewController = storyboard.instantiateInitialViewController() as? CameraViewController else {
            fatalError("Couldn't instanciate a ViewController class.")
        }
        
        return CameraViewController
    }
    
    func updateUIViewController(_ uiViewController: CameraViewController, context: Context) {
        
    }
    
    typealias UIViewControllerType = CameraViewController
}


struct MyGameView: View {
    func sizedScene(size: CGSize) -> SKScene {
        let scene = GameScene(size: size)
        scene.scaleMode = .fill
        return scene
    }
    
    var body: some View {
        GeometryReader { geometry in
            SpriteView(scene: sizedScene(size: CGSize(width: geometry.size.width, height: geometry.size.height)))
                .frame(width: geometry.size.width, height: geometry.size.height)
        }.edgesIgnoringSafeArea(.all)
    }
}
