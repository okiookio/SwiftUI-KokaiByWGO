//
//  UploadImageView.swift
//  KokaiByWGO
//
//  Created by Waleerat Gottlieb on 2021-06-02.
//

import SwiftUI
import Kingfisher

struct UploadImageView: View {
    // Note: - For Upload file
    @Binding  var swiftUIImage: SwiftUI.Image?
    @Binding var uploadedImageURL: String
    @Binding  var isShowingImagePicker: Bool
    
    var body: some View {
        ZStack{
            Color.clear
            // MARK: - HStack
            if swiftUIImage != nil {
                swiftUIImage?
                    .resizable()
                    .scaledToFit()
                    .frame(width: kScreen.width * 0.5, height: kScreen.height * 0.2)
                    .cornerRadius(15)
                
            } else {
                if uploadedImageURL != "" {
                    KFImage(URL(string: uploadedImageURL)!)
                        .resizable()
                        .scaledToFit()
                        .frame(width: kScreen.width * 0.5, height: kScreen.height * 0.2)
                        .cornerRadius(15)
                        .onTapGesture {
                            self.isShowingImagePicker = true
                        }
                     
                } else {
                    Image(systemName: "camera")
                        .resizable()
                        .frame(width: 150, height: 150)
                        .foregroundColor(Color("CameraBackgroundColor"))
                        .onTapGesture {
                            self.isShowingImagePicker = true
                        }
                }
                
            }
            
            
        }
    }
}
 
/*
struct UploadImageView_Previews: PreviewProvider {
    static var previews: some View {
        UploadImageView()
            .previewLayout(.fixed(width: 200, height: 200))
        
    }
}
*/
