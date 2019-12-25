/*
 See LICENSE folder for this sample’s licensing information.
 
 Abstract:
 A view showing the details for a hike.
 */

import SwiftUI

struct HikeDetail: View {
    let hike: Hike
    @State var dataToShow = \Hike.Observation.elevation
    
    var buttons = [
        ("Elevation", \Hike.Observation.elevation, "triangle"),
        ("Heart Rate", \Hike.Observation.heartRate, "heart"),
        ("Pace", \Hike.Observation.pace, "clock"),
    ]
    
    var iconColor: Color {
        switch dataToShow {
        case \Hike.Observation.elevation:
            return Color(hue: 0.6, saturation: 0.73, brightness: 0.7)
        case \Hike.Observation.heartRate:
            return Color(hue: 0, saturation: 0.5, brightness: 0.7)
        case \Hike.Observation.pace:
            return Color(hue: 0.7, saturation: 0.4, brightness: 0.7)
        default:
            return Color(hue: 0.0, saturation: 0.0, brightness: 0.0)
        }
    }
    
    var body: some View {
        return VStack {
            HikeGraph(hike: hike, path: dataToShow)
                .frame(height: 200, alignment: .center)
            
            HStack(spacing: 50) {
                    ForEach(self.buttons, id: \.0) { value in
                        Button(action: {
                            self.dataToShow = value.1
                        }) {
                            VStack {
                                Image(systemName: value.1 == self.dataToShow
                                    ? "\(value.2).fill"
                                    : value.2)
                                    .imageScale(.large)
                                Text(verbatim: value.0)
                                    .font(.system(size: 12))
                            }
                            .foregroundColor(value.1 == self.dataToShow
                                ? self.iconColor
                                : Color.gray)
                                .animation(nil)
                        }
                    }
                }
                .padding(.top, 70)
            
            
        }
    }
    
}

struct HikeDetail_Previews: PreviewProvider {
    static var previews: some View {
        HikeDetail(hike: hikeData[0])
    }
}
