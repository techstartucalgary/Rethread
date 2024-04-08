// ScannerViewModel.swift

import Foundation
import Observation
import SwiftUI

class ScannerViewModel: Observable {

    func uploadImageToScanner(base64String: String) {
        print("Starting image upload process")
        guard let url = URL(string: "http://localhost:3002/api/v1/scanner/") else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        let json: [String: Any] = [
            "imageUrl": "data:image/jpeg;base64,\(base64String)"

        ]

        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: json)
        } catch {
            print("Error: Unable to encode json to Data")
            return
        }

        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error during URLSession data task: \(error.localizedDescription)")
                return
            }


            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode),
                  let responseData = data else {
                print("Error with the response, unexpected status code: \(String(describing: response))")
                return
            }

            if let responseString = String(data: responseData, encoding: .utf8) {
                print("Response data string:\n\(responseString)")
            } else {
                print("Could not decode response data")
            }

        }.resume()
    }

    func convertImageToBase64(img: UIImage) -> String {
        print("Converting to base 64")
        return img.jpegData(compressionQuality: 1.0)?.base64EncodedString() ?? ""
    }
}
