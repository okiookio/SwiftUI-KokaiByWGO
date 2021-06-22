//
//  AlphabetCareInfoView.swift
//  KokaiByWGO
//
//  Created by Waleerat Gottlieb on 2021-06-03.
//

import SwiftUI

struct CardInfoView: View {
    @State var infoHeader: String
    @State var infoDetail: String
    
    var body: some View {
        HStack {
            Text(infoHeader)
                .foregroundColor(Color.black)
                  .font(.title2)
                .fontWeight(.bold)
            Spacer()
            Text(infoDetail)
                .foregroundColor(Color.black)
                  .font(.title2)
        }
    }
}

struct AlphabetCareInfoView_Previews: PreviewProvider {
    static var previews: some View {
        CardInfoView(infoHeader: "infoHeader", infoDetail: "infoDetail")
            .previewLayout(.fixed(width: 375, height: 60))
    }
}
