// ProductViewModel.swift
import Foundation
import Observation

struct ClothingItemDTO: Codable {
    let title: String
    let category: String
    let size: String
    let color: String
    let price: Int
    let productUrl: String?
    let imageUrl: String
    let description: String
}

@Observable class FetchClothing {
    var allItems: [ClothingItem] = []
    var genTops: [ClothingItem] = []
    var genBottoms: [ClothingItem] = []


    func fetchClothing() {


        guard let url = URL(string: "http://localhost:3001/api/v1/product") else {
            print("Bad URL")
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        URLSession.shared.dataTask(with: request) { data, response, error in
            // Check for errors, unwrap the data
            if let error = error {
                print("Error fetching data: \(error.localizedDescription)")
                return
            }
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                print("Error with the response, unexpected status code: \(String(describing: response))")
                return
            }
            if let jsonData = data {
                // Now jsonData contains your raw data
                DispatchQueue.main.async { [self] in
                    if let clothingItemsDTO = decodeClothingItems(from: jsonData) {
                        let clothingItems = clothingItemsDTO.map(transform)
                        allItems = clothingItems
                        genTops = clothingItems.filter { $0.type == .tops }
                        genBottoms = clothingItems.filter { $0.type == .bottoms }

                    }
                }
            }
        }.resume()
    }


    private func decodeClothingItems(from jsonData: Data) -> [ClothingItemDTO]? {
            let decoder = JSONDecoder()
            do {
                let clothingItems = try decoder.decode([ClothingItemDTO].self, from: jsonData)
                return clothingItems
            } catch {
                print("Error decoding JSON: \(error)")
                return nil
            }
        }

    private func transform(dto: ClothingItemDTO) -> ClothingItem {

        let name  = dto.title
        let price = dto.price
        let imageUrl = dto.imageUrl
        let color = dto.color
        let description = dto.description

        let type = ClothingType(rawValue: dto.category) ?? .tops
        let style = ClothingStyle(rawValue: dto.description) ?? .active

        let productUrl = dto.productUrl

        return ClothingItem(name: name, type: type, color: color, price: price, imageName: imageUrl, style: style, productLink: productUrl, description: description)


        }
}
