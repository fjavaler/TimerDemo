//
//  ContentView.swift
//  TimerAndOnReceiveDemo
//
//  Created by Fred Javalera on 6/10/21.
//

import SwiftUI

struct ContentView: View {
  
  // MARK: Properties
  // Step 1. Create a publisher. Set how often repeats in "every"
  let timer = Timer.publish(every: 0.5, on: .main, in: .common)
    .autoconnect()
  
  // Current time
  /*
   @State var currentDate: Date = Date()
   var dateFormatter: DateFormatter {
   let formatter = DateFormatter()
   formatter.timeStyle = .medium
   //    formatter.dateStyle = .medium
   return formatter
   }
   */
  
  // Countdown
  /*
   @State var count: Int = 10
   @State var finishedText: String? = nil
   */
  
  // Countdown to date
  /*
  @State var timeRemaining: String = ""
  let futureDate: Date = Calendar.current.date(byAdding: .hour, value: 1, to: Date()) ?? Date()
  
  func updateTimeRemaining() {
    let remaining = Calendar.current.dateComponents([.minute, .second], from: Date(), to: futureDate)
    let hour = remaining.hour ?? 0
    let minute = remaining.minute ?? 0
    let second = remaining.second ?? 0
    timeRemaining = "\(minute) minutes, \(second) seconds"
  }
*/
  
  // Animation counter
  @State var count: Int = 0
  
  // MARK: Body
  var body: some View {
    
    ZStack {
      
      RadialGradient(gradient: Gradient(
                      colors: [Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)), Color(#colorLiteral(red: 0.09019608051, green: 0, blue: 0.3019607961, alpha: 1))]),
                     center: .center,
                     startRadius: 5,
                     endRadius: 500)
        .ignoresSafeArea()
      
      //      //Current time
      //      Text(dateFormatter.string(from: currentDate))
      //        .font(.system(size: 100, weight: .semibold, design: .rounded))
      //        .foregroundColor(.white)
      //        .lineLimit(1)
      //        .minimumScaleFactor(0.1)
      
      //      // Countdown
      //      Text(finishedText ?? "\(count)")
      //        .font(.system(size: 100, weight: .semibold, design: .rounded))
      //        .foregroundColor(.white)
      //        .lineLimit(1)
      //        .minimumScaleFactor(0.1)
      
      //      // Countdown to date
//      Text(timeRemaining)
//        .font(.system(size: 100, weight: .semibold, design: .rounded))
//        .foregroundColor(.white)
//        .lineLimit(1)
//        .minimumScaleFactor(0.1)
      
      // Animation counter
      HStack(spacing: 15) {
        Circle()
          .offset(y: count == 1 ? -20 : 0)
        Circle()
          .offset(y: count == 2 ? -20 : 0)
        Circle()
          .offset(y: count == 3 ? -20 : 0)
      }
      .frame(width: 150)
      .foregroundColor(.white)
      
    }
    //    //Step 2. Listen to our publisher
    
//    //Current Time
//    .onReceive(timer, perform: { value in
//      // Step 3. Perform an action
//      currentDate = value
//    })
    
//    // Countdown
//    .onReceive(timer, perform: { _ in
//      if count <= 1 {
//        finishedText = "Blastoff!"
//      } else {
//        count -= 1
//      }
//    })
    
//    // Countdown to date
//    .onReceive(timer, perform: { _ in
//      updateTimeRemaining()
//    })
    
    // Animation counter
    .onReceive(timer, perform: { _ in
      withAnimation(.easeInOut(duration: 0.5)) {
        count = count == 3 ? 0 : count + 1
      }
    })
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
