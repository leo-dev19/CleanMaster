import Foundation

struct QuotesResponse: Codable{
    let quotes: [Quote]
}

struct Quote: Codable {
    var id: Int
    var quote: String
    var author: String
}
