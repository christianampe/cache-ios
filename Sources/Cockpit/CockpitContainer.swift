//
//  Created by Christian Ampe on 6/24/19.
//

class CockpitContainer<T: Any> {
    
    /// The internally managed generic object.
    let object: T
    
    /// The explicit initializer.
    /// - Parameter object: The object to be wrapped in the container.
    init(_ object: T) {
        self.object = object
    }
}
