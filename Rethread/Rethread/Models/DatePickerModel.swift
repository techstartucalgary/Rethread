import SwiftUI

func formatDate(_ string: String) -> String {
    // Remove any non-numeric characters
    let numericString = string.filter { "0123456789".contains($0) }
    
    // Break the string down into components
    var components = numericString.map { String($0) }
    
    // Add slashes at the appropriate places
    if components.count > 2 {
        components.insert("/", at: 2)
    }
    if components.count > 5 {
        components.insert("/", at: 5)
    }
    
    // Combine the components into a single string
    let formattedString = components.joined()
    
    // Ensure the string is not longer than the max length (10 including slashes)
    let endIndex = formattedString.index(formattedString.startIndex, offsetBy: min(10, formattedString.count))
    return String(formattedString[..<endIndex])
}

// Extract the month, day, and year from a date string

// modal view for date picker
struct DatePickerModalView: View {
    @Binding var showModal: Bool
    @Binding var chosenDate: String

    @State private var selectedDate = Date()
    @State private var currentDate = Date()
    @State private var currentMonth = 0


    var body: some View {
        VStack (spacing: 0) {
            let days = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]
            // Date selected at the top MM / DD / YYYY
            HStack {
                // Date selected MM / DD / YYYY
                Text(dateToString(date: selectedDate))
                    .font(.system(size: 20))
                    .foregroundColor(Color.primaryTextColor)
                Spacer()
                Image(systemName: "calendar")
                    .foregroundColor(Color.primaryColor)
                    .font(.system(size: 20))     
            }
            .padding()
            .padding(.top, 15)
            
            // add border at the bottom
            Rectangle()
                .frame(height: 1)
                .foregroundColor(Color(red: 229/255, green: 228/255, blue: 226/255))

            HStack {
                // Left Arrow
                Button(action: {
                        currentMonth -= 1
                }) {
                    Image(systemName: "chevron.left")
                        .foregroundColor(Color.primaryColor)
                        .font(.system(size: 17))
                        .fontWeight(.bold)
                }

                Spacer()

                Text("\(extraData()[0]) \(extraData()[1])")
                    .font(.system(size: 20))
                    .fontWeight(.bold)
                    .foregroundColor(Color.primaryTextColor)
                
                Spacer()

                // Right Arrow
                Button(action: {
                        currentMonth += 1
                }) {
                    Image(systemName: "chevron.right")
                        .foregroundColor(Color.primaryColor)
                        .font(.system(size: 17))
                        .fontWeight(.bold)
                }
            }
            .padding()
            .padding(.top, 10)

            // Days of the week
            HStack(spacing: 0) {
                ForEach(days, id: \.self) { day in
                    Text(day)
                        .font(.body)
                        .foregroundColor(Color.gray)
                        .frame(maxWidth: .infinity)
                }
            }
            .padding(.horizontal)
            .padding(.bottom, 10)

            // Days of the month
            // Lazy Grid
            let columns = Array(repeating: GridItem(.flexible(), spacing: 1), count: 7)

            LazyVGrid(columns: columns, spacing: 1) {
                ForEach(extractDate()) { date in

                    if date.day == -1 {
                        CardView(value: date)
                            .hidden()
                    } else {
                        CardView(value: date)
                            .background(
                                Circle()
                                    .fill(Color.primaryTextColor)
                                    .padding(.horizontal, 1)
                                    .opacity(isSameDay(date1: date.date, date2: selectedDate) ? 1 : 0)
                            )
                            .onTapGesture {
                                currentDate = date.date
                                selectedDate = currentDate
                            }

                            
                    }
                }
            }
            .padding(.horizontal)

            Spacer()
            
            HStack {
                Button("Today") {
                    // Handle clear action
                    currentDate = Date()
                    selectedDate = currentDate
                    // Change currentMonth to 0
                    currentMonth = 0
                    // change chosenDate to ""
                    chosenDate = dateToString(date: Date())
                } 
                .buttonStyle(SecondaryButtonStyle(width: 115))
                

                Button("Apply") {
                    // Handle apply action
                    chosenDate = dateToString(date: currentDate)
                    showModal = false
                }
                .buttonStyle(PrimaryButtonStyle(width: 115))
            }
            .padding()
        }
        .padding(.horizontal, 24)
        .background(RoundedCorners(
            color: .white,
            tl: 15,
            tr: 15,
            bl: 10,
            br: 10
        ))
        .onChange(of: currentMonth) { newValue, oldValue in
            currentDate = getCurrentMonth()
        }
        .onAppear(
            perform: {
                // Start from where the current date is
                currentDate = stringToDate(date: chosenDate)
                selectedDate = currentDate
                currentMonth = 0

            }
        )
    }
    
    @ViewBuilder
    func CardView(value: DateValue)->some View{
        Text("\(value.day)")
            .font(.body)
            .frame(maxWidth: .infinity)
            .frame(height: 40)
            .foregroundColor(isSameDay(date1: selectedDate, date2: value.date) ? Color.white : Color.primaryTextColor)
            .fontWeight(isSameDay(date1: selectedDate, date2: value.date) ? .bold : .none)
    }

    // String to date
    func stringToDate(date: String) -> Date {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/yyyy"
        return formatter.date(from: date) ?? Date()
    }

    // Date to string
    func dateToString(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/yyyy"
        return formatter.string(from: date)
    }

    func isSameDay(date1: Date, date2: Date) -> Bool {
        let calendar = Calendar.current
        // Print the dates if same day
        return calendar.isDate(date1, inSameDayAs: date2)
    }
    
    func extraData() -> [String] {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM YYYY"
        

        let date = formatter.string(from: currentDate)
        return date.components(separatedBy: " ")
    }

    func getCurrentMonth() -> Date {
        let calendar = Calendar.current

        guard let currentMonth = calendar.date(byAdding: .month, value: currentMonth, to: stringToDate(date: chosenDate)) else { return Date() }
        return currentMonth
    }
    func extractDate()->[DateValue]{
        let calendar = Calendar.current

        let currentMonth = getCurrentMonth()

        var days = currentMonth.getAllDates().compactMap { date -> DateValue in
            let day = calendar.component(.day, from: date)
            
            return DateValue(day: day, date: date)
        }
        let firstWeekDay = calendar.component(.weekday, from: days.first?.date ?? Date())

        for _ in 0..<firstWeekDay-1{
            days.insert(DateValue(day: -1, date: Date()), at: 0)
        }

        return days
    }
}

extension Date{
    func getAllDates() -> [Date]{
        let calender = Calendar.current

        let startDate = calender.date(from: calender.dateComponents([.year, .month], from: self))!
        
        let range = calender.range(of: .day, in: .month, for: self)!

        // getting date
        return range.compactMap { day -> Date in
            return calender.date(byAdding: .day, value: day - 1 , to: startDate)!
        }
    }
}

// Date value modal
struct DateValue: Identifiable {
    var id = UUID().uuidString
    var day: Int
    var date: Date
}

// Present the date picker modal view
struct DatePickerModalView_Previews: PreviewProvider {
    static var previews: some View {
        DatePickerModalView(showModal: .constant(true), chosenDate: .constant("09/05/1992"))
            .previewLayout(.sizeThatFits)
    }
}
