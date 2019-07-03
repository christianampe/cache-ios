//
//  Created by Christian Ampe on 6/24/19.
//

import Foundation.NSCache

private protocol CockpitProtocol {
    
    /// The associated item type to be stored in the cache.
    associatedtype T: Any
    
    /// The method used to store an object in the cache with a given key.
    /// - Parameter object: The object to be cached.
    /// - Parameter key: The key used to manage the object in the cache.
    func set(object: T, forKey key: String)
    
    /// The method used to retrieve an object from the cache.
    /// - Parameter key: The key associated with the requested object.
    /// - Returns: An object associated with the input key.
    func object(forKey key: String) -> T?
}

public struct Cockpit<T: Any> {
    
    /// The internally managed cache.
    ///
    /// Do not perform any explicit writes to this cache. Instead utilize the `set(object: T, forKey key: String)` method.
    private let cache = NSCache<NSString, CockpitContainer<T>>()
}

// MARK: - CockpitProtocol Conformance
extension Cockpit: CockpitProtocol {
    public func set(object: T, forKey key: String) {
        cache.setObject(CockpitContainer(object), forKey: key as NSString)
    }
    
    public func object(forKey key: String) -> T? {
        guard let container = cache.object(forKey: key as NSString) else {
            return nil
        }
        
        return container.object
    }
}
