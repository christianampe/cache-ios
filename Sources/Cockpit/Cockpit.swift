//
//  Created by Christian Ampe on 6/24/19.
//

import Foundation

public protocol Cockpit {
    
    /// The associated item type to be stored in the cache.
    associatedtype T: Any
    
    /// The internally managed cache.
    ///
    /// Do not perform any explicit writes to this cache. Instead utilize the `set(object: T, forKey key: String)` method.
    var storage: NSCache<NSString, CockpitContainer<T>> { get }
    
    /// The method used to store an object in the cache with a given key.
    /// - Parameter object: The object to be cached.
    /// - Parameter key: The key used to manage the object in the cache.
    func set(object: T, forKey key: String)
    
    /// The method used to retrieve an object from the cache.
    /// - Parameter key: The key associated with the requested object.
    /// - Returns: An object associated with the input key.
    func object(forKey key: String) -> T?
}

// MARK: - Default Implementation
extension Cockpit {
    public func set(object: T, forKey key: String) {        
        storage.setObject(CockpitContainer(object), forKey: key as NSString)
    }
    
    public func object(forKey key: String) -> T? {
        guard let container = storage.object(forKey: key as NSString) else {
            return nil
        }
        
        return container.object
    }
}
