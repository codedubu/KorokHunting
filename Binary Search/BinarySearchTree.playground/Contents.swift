import UIKit

class Node {
    
    var value: String
    var children: [Node] = []
    weak var parent: Node?
    
    init(value: String) {
        self.value = value
    }
    
    func add(child: Node) {
        children.append(child)
        child.parent = self
    }
}

let devices = Node(value: "Devices")
let appleDevices = Node(value: "Apple")
let androidDevices = Node(value: "Android")

devices.add(child: appleDevices)
devices.add(child: androidDevices)

let iPhone = Node(value: "iPhone")
let macBook = Node(value: "Macbook")

appleDevices.add(child: iPhone)
appleDevices.add(child: macBook )

iPhone.add(child: Node(value: "iPhone X"))
iPhone.add(child: Node(value: "iPhone 4S"))

let galaxy = Node(value: "Galaxy")
let googlePixel = Node(value: "Google Pixel")

androidDevices.add(child: galaxy)
androidDevices.add(child: googlePixel)



print(devices)

extension Node: CustomStringConvertible {
    var description: String {
        var text =  "\(value)"
        
        if !children.isEmpty {
            text += " {" + children.map { $0.description }.joined(separator: ", ") + "} "
        }
        return text
    }
}

extension Node {
    
    func search(value: String) -> Node? {
        if value == self.value {
            return self
        }
        
        for child in children {
            if let found = child.search(value: value) {
                return found
            }
        }
        return nil
    }
}

let searchResults = devices.search(value: "Galaxy")
print(searchResults)
