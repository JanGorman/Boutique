import Foundation

public extension Store where Item: Identifiable, Item.ID == String {

    /// Initializes a new ``Store`` for persisting items to a memory cache and a storage engine, acting as a source of truth.
    ///
    /// This initializer eschews providing a `cacheIdentifier` when our `Item` conforms to `Identifiable`
    /// with an `id` that is a `String`. While it's not required for your `Item` to conform to `Identifiable`,
    /// many SwiftUI-related objects do so this initializer provides a nice convenience.
    /// - Parameter storage: A `StorageEngine` to initialize a ``Store`` instance with.
    /// - Parameter sortBy: An optional function that the ``Store`` uses to keep the items added to it sorted
    convenience init(storage: StorageEngine, sortBy: ((Item, Item) -> Bool)? = nil) {
        self.init(storage: storage, cacheIdentifier: \.id, sortBy: sortBy)
    }

}

public extension Store where Item: Identifiable, Item.ID == UUID {

    /// Initializes a new ``Store`` for persisting items to a memory cache and a storage engine, acting as a source of truth.
    ///
    /// This initializer eschews providing a `cacheIdentifier` when our `Item` conforms to `Identifiable`
    /// with an `id` that is a `UUID`. While it's not required for your `Item` to conform to `Identifiable`,
    /// many SwiftUI-related objects do so this initializer provides a nice convenience.
    /// - Parameter storage: A `StorageEngine` to initialize a ``Store`` instance with.
    /// - Parameter sortBy: An optional function that the ``Store`` uses to keep the items added to it sorted
    convenience init(storage: StorageEngine, sortBy: ((Item, Item) -> Bool)? = nil) {
        self.init(storage: storage, cacheIdentifier: \.id.uuidString, sortBy: sortBy)
    }

}
