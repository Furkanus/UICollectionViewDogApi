//
//  GetData.swift
//  DogApiUICollection
//
//  Created by Furkan Hanci on 3/28/21.
//

import UIKit
  
class GetData : NSObject {
   private func fetchRandomDogImage() {
           
           guard let url = URL(string: "https://dog.ceo/api/breeds/image/random") else { return }
           
           let session = URLSession.shared
           
           let task = session.dataTask(with: url) { [weak self] data, response, error in
               if let error = error {
                   print(error.localizedDescription)
                   return
               }
               
               guard let self = self, let data = data else { return }
               
               let decoder = JSONDecoder()

               do {
                let randomImageJson = try decoder.decode(ImageModel.self, from: data)
                   self.downloadImage(urlString: randomImageJson.message)
               } catch {
                
                print(error.localizedDescription)
               }
           }
           
    task.resume()
       }
    
    
    private func downloadImage(urlString: String) {
         guard let url = URL(string: urlString) else { return }
         
         let session = URLSession.shared
         
         let task = session.dataTask(with: url) { [weak self] data, response, error in
             if let error = error {
                 print(error.localizedDescription)
                 return
             }
             
            guard let _ = self, let _ = data else { return }
             
             DispatchQueue.main.async {
                // self.imageView.image = UIImage(data: data)
             }
         }
         
         task.resume()
     }
}



