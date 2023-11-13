//
//  APIManager.swift
//  iTunes
//
//  Created by 서승우 on 2023/11/12.
//

import Foundation
import Alamofire

final class APIManager {
    static let shared = APIManager()

    private init() {}

    func request() {
        let url = URL(string: "https://itunes.apple.com/search?term=yelp&country=us&entity=audiobook")!
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("❌ \(error.localizedDescription)")
            }

            guard let statusCode = (response as? HTTPURLResponse)?.statusCode else {
                print("❌ HTTPURLResponse Error")
                return
            }
            guard (200...299).contains(statusCode) else {
                print("❌ contains Error")
                return
            }

            guard let data = data else {
                print("❌ data Error")
                return
            }

            do {
                let appContainer = try JSONDecoder().decode(AppContainer.self, from: data)
                print(appContainer)
            } catch {
                print("❌ decode Error")
            }
        }
        .resume()

//        AF
//            .request(
//                "https://itunes.apple.com/search?term=kakao&country=kr&lang=ko_kr&entity=software&limit=2",
//                method: .get
//            )
//            .validate()
//            .responseDecodable(of: AppContainer.self) { response in
//                switch response.result {
//                case .success(let succes):
//                    print("✅ \(succes)")
//                case .failure(let error):
//                    print("❌ \(error)")
//                }
//            }
    }

}

// MARK: - Welcome
struct AppContainer: Codable {
    let appList: [App]

    enum CodingKeys: String, CodingKey {
        case appList = "results"
    }
}

// MARK: - Result
struct App: Codable {
    let artworkUrl60, artworkUrl100: String
    let screenshotUrls: [String]
    let releaseNotes: String
    let artistName: String
    let genres: [String]
    let description: String
    let trackName: String
    let averageUserRating: Double
    let version: String
}
