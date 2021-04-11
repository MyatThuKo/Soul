//
//  CalendarView.swift
//  Soul
//
//  Created by Myat Thu Ko on 4/11/21.
//

import SwiftUI

struct CalendarView: View {
    // MARK: - PROPERTIES
    @Environment(\.presentationMode) private var presentationMode
    
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }()
    
    @State private var date = Date()
    
    // MARK: - BODY
    var body: some View {
        NavigationView {
            VStack {
                DatePicker("Today's Date is", selection: $date, in: ...Date())
                    .datePickerStyle(GraphicalDatePickerStyle())
                
                Text("Today's Date is \(date, formatter: dateFormatter)...")
            } //: VStack
            .navigationBarItems(trailing: Button(action: {
                presentationMode.wrappedValue.dismiss()
            }, label: {
                Image(systemName: "checkmark.circle.fill")
                    .resizable()
                    .frame(width: 25, height: 25)
            })
            )
        } //: NavigationView
    }
}

// MARK: - PREVIEW

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
