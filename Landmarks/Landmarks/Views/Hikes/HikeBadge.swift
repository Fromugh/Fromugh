//
//  HikeBadge.swift
//  Landmarks
//
//  Created by Sungjae Heo on 11/3/24.
//

import SwiftUI

struct HikeBadge: View {
    var name: String
    var body: some View {
        VStack(alignment: .center) {
            Badge()
                .frame(width: 300, height: 300)
                .scaleEffect(1.0 / 3.0)
                .frame(width: 100, height: 100) // Badge를 그리는 로직은 그려지는 프레임 사이즈에 의존하기 때문에 원하는 모습을 그리는 프레임 사이즈에 맞춘 후에 일정한 비율로 축소하고, 축소한 비율에 맞춰서 프레임의 사이즈도 제한하는 모습이라고 한다.
            Text(name)
                .font(.caption)
                .accessibilityLabel("Badge for \(name).")
        }
    }
}

#Preview {
    HikeBadge(name: "Preview Testing")
}
