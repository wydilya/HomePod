//
//  ContentView.swift
//  HomePod
//
//  Created by Ilya Zelkin on 30.05.2022.
//

import SwiftUI
import PureSwiftUI

struct HomePodTopView: View {
    var body: some View {
        let mesh = ZStack {
            ForEach(0..<130) { index in
                Circle()
                    .strokeBorder(Color.white(0.15), lineWidth: 1.25)
                    .frame(160)
                    .xOffset(120)
                    .rotate(2.7692.degrees * index)
            }
        }
        ZStack {
            //base
            Circle()
                .scale(0.95)
                .shadowColor(.white(0.15), 10, y: 18)
            Circle()
                .fillColor(.black)
            //mesh
            mesh
            Circle()
                .scale(0.88)
                .fillColor(.white(0.35))
                .blur(15)
                .mask(mesh)
                .blendMode(.screen)
            //user interface
            Group {
                Circle()
                    .scale(1.01)
                    .fillColor(.black)
                    .blur(5)
                Circle()
                    .fill(LinearGradient([.white(0.2), .black, .black], to: .bottom))
                Circle()
                    .strokeBorder(AngularGradient([.white, .black, .white, .black, .white, .black, .white], angle: -10.degrees), lineWidth: 2)
                    .blur(1)
            }
            .scale(0.63)
            //siri circle
            Group {
                Circle()
                    .fill(AngularGradient([.blue, .blue, Color.cgCyan.opacity(0.8), .purple, .purple, .purple, .blue], angle: -10.degrees))
                    .scale(0.17)
                    .blur(10)
                    .saturation(1.4)
                    .brightness(0.3)
                    .drawingGroup()
                Circle()
                    .scale(0.16)
                    .stroke(AngularGradient([.blue, .green, .red, .blue], angle: -10.degrees), lineWidth: 3)
                    .blur(6)
                    .saturation(2)
                Circle()
                    .scale(0.075)
                    .fillColor(.white)
                    .blur(12)
            }
            .blur(4)
            .mask(Circle().scale(0.22).blur(7))
        }
    }
}

struct HomePodTopView_Previews: PreviewProvider {
    struct HomePodTopView_Harness: View {

        var body: some View {
            HomePodTopView()
                .frame(400)
                .padding(50)
        }
    }

    static var previews: some View {
        HomePodTopView_Harness()
            .previewSizeThatFits()
    }
}
