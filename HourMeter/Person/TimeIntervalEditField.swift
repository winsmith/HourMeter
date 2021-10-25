//
//  TimeIntervalEditField.swift
//  HourMeter
//
//  Created by Daniel Jilg on 25.10.21.
//

import SwiftUI

struct TimeIntervalEditField: View, Animatable {
    @Binding var timeInterval: TimeInterval

    var animatableData: TimeInterval {
        get { timeInterval }
        set { timeInterval = newValue }
    }

    var body: some View {
        HStack {
            Button {
                withAnimation {
                    timeInterval -= 3600
                }
            } label: {
                Text("-")
                    .frame(width: 22, height: 22)
                    .font(.largeTitle)
                    .padding()
                    .foregroundColor(.accentColor)
            }
            .buttonStyle(PlainButtonStyle())

            Spacer()

            VStack {
                Text(DateComponentsFormatter.timeIntervalString(from: timeInterval))
                    .font(.largeTitle)
                Text("hours")
                    .foregroundColor(.secondary)
            }

            Spacer()

            Button {
                withAnimation {
                    timeInterval += 3600
                }
            } label: {
                Text("+")
                    .frame(width: 22, height: 22)
                    .font(.largeTitle)
                    .padding()
                    .foregroundColor(.accentColor)
            }
            .buttonStyle(PlainButtonStyle())
        }
    }
}

struct TimeIntervalEditField_Previews: PreviewProvider {
    static var previews: some View {
        TimeIntervalEditField(timeInterval: .constant(3600))
            .previewLayout(.fixed(width: 400, height: 300))
    }
}
