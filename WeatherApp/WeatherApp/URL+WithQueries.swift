import Foundation

extension URL {
    func withQueries(_ quries: [String: String]) -> URL? {
        var components = URLComponents(url: self, resolvingAgainstBaseURL: true)
        components?.queryItems = quries.map
        { URLQueryItem(name: $0.0, value: $0.1) }
        return components?.url
    }
}
