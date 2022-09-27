import UIKit

struct Mobile: Hashable {
    let imei: String
    let model: String
}

let mobileData: Set<Mobile> = [
    Mobile(imei: "1", model: "iPhone 5"),
    Mobile(imei: "2", model: "iPhone 6 Plus"),
    Mobile(imei: "3", model: "iPhone 8"),
    Mobile(imei: "4", model: "iPhone 11"),
    Mobile(imei: "5", model: "iPhone SE")
]

protocol MobileStorage {
    func getAll() -> Set<Mobile>
    func findByImei(_ imei: String) -> Mobile?
    func save(_ mobile: Mobile) throws -> Mobile
    func delete(_ product: Mobile) throws
    func exists(_ product: Mobile) -> Bool
}

class MobileCl: MobileStorage {
    
    func getAll() -> Set<Mobile> {
        return mobileData
    }
    
    func findByImei(_ imei: String) -> Mobile? {
        let mobileAll = getAll()
        let mobile = mobileAll.filter() { $0.imei == imei }
        return mobile.first
    }
    
    func save(_ mobile: Mobile) throws -> Mobile {
        UserDefaults.standard.set(mobile.model, forKey: mobile.imei)
        return mobile
    }
    
    func delete(_ product: Mobile) throws {
        UserDefaults.standard.removeObject(forKey: product.imei)
    }
    
    func exists(_ product: Mobile) -> Bool {
        return findByImei(product.imei) != nil
    }
    
}

