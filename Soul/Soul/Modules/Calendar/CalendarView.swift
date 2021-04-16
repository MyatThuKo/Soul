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
    @ObservedObject var viewModel: JournalViewModel
    
    // MARK: - BODY
    var body: some View {
        NavigationView {
            VStack {
                DatePicker("Today's Date is", selection: $viewModel.date, in: ...Date())
                    .datePickerStyle(GraphicalDatePickerStyle())
                
                Text("Journal for \(viewModel.dateText)")
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
        CalendarView(viewModel: JournalViewModel())
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
