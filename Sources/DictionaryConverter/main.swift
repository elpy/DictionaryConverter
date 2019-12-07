
import Foundation

let container = DependencyContainer()

do {
    print("Connecting...")
    let dataStore = try container.makeMongoDataStore()
    let records = try dataStore.get()
    
    let filtered = records.filter { $0.text == "work" }
    for record in filtered {
        print(record)
        print("")
    }
    
    print("Finished.")
} catch DataStoreError.convertError(let message) {
    print(message)
} catch {
    print("Error")
}

