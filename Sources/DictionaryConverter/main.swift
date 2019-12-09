
import Foundation

let container = DependencyContainer()

do {
    print("Connecting...")
    let source = try container.makeMongoDataStore()
    let destination = try container.makeRealmDataStore()

    print("Processing...")
    let records = try source.get()
    try destination.add(records: records)
    
    print("Finished.")
} catch DataStoreError.convertError(let message) {
    print(message)
} catch {
    print("Error \(error)")
}

