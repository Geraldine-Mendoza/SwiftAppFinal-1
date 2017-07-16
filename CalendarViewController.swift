//
//  CalendarViewController.swift
//  FInal Project
//
//  Created by Rida Rahman on 2017-05-31.
//  Copyright © 2017 Student. All rights reserved.
//
// https://stackoverflow.com/questions/25533147/get-day-of-week-using-nsdate-swift
// https://classictutorials.com/2015/07/how-to-get-current-day-month-and-year-in-nsdate-using-swift/
//

import UIKit

//Days cells
class CalendarCells: UICollectionViewCell {
    //Label in cell (Displays day of month)
    @IBOutlet weak var daysLabel: UILabel!
}

// CalendarViewController Class
class CalendarViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    @IBOutlet weak var previousMonth: UIButton!
    @IBOutlet weak var nextMonth: UIButton!
    @IBOutlet weak var monthLabel: UILabel!
    @IBOutlet weak var CalendarCollectionView: UICollectionView!
    @IBOutlet weak var calendarCell: UICollectionView!
    @IBOutlet weak var booksReadOnDay: UITableView!
    
    
    // Number of days corresponding to each month
    let monthNames = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
    let daysInMonth = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    let leapYear = 29
    
    
    //Get user's date
    let date = Date()
    //Format of date
    let formatter = DateFormatter()
    //Turns date into string (To use in fuction)
    var stringDate = String()
    // Weekday is used to count blank days before month starts
    var dayCounter = Int()
    // Day of the month
    var day = Int()
    // Number in label in cell
    var dayLabel = 1
    // Month of year
    var month = Int()
    // Year
    var year = Int()
    //Defines type of calendar
    let calendar = NSCalendar(calendarIdentifier: NSCalendar.Identifier(rawValue: NSGregorianCalendar))!
    // Day the month starts on
    var monthStart = Int()
    // temp for calculating start of month for next/previous month
    var nextMonthStart = Int()
    var prevMonthStart = Int()
    // Number of days in the month
    var numberOfDaysInMonth = Int()
    var prevNumberOfDaysInMonth = Int()
    var nextNumberOfDaysInMonth = Int()
    // Used when current month is december
    var tempNextMonth = Int()
    // Used when current month is january
    var tempPrevMonth = Int()
    
    @IBOutlet weak var menuButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //burger side bar menu
        if revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = #selector((SWRevealViewController.revealToggle) as (SWRevealViewController) -> (Void) -> Void) // Swift 3 fix
            view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        
        
        //Prints user's date
        print("User's date = \(date)")
        
        
        //Format of date
        formatter.dateFormat = "yyyy.MM.dd"
        
        //Turns date into string
        stringDate = String(describing: date)
        
        //Gets weekday
        let weekday = getDayOfWeek(stringDate)
        
        //Unwraps if not nil
        if weekday != nil {
            print("Weekday = \(weekday!)") // 4 = Wednesday
            dayCounter = weekday!
        }
            
        else {
            print("Weekday = nil")
        }
        
        //Turns date into day, month, and year seperately
        day = calendar.component(.day, from: date)
        //Month = month-1 (Arrays start at 0, while months start at 01)
        month = (calendar.component(.month, from: date) - 1)
        year = calendar.component(.year, from: date)
        
        if month == 00 {
            tempPrevMonth = 11
        }
        else {
            tempPrevMonth = (month-1)
        }
        if month == 11 {
            tempNextMonth = 00
        }
        else {
            tempNextMonth = (month+1)
        }
        
        if ((Int(year)%4 == 0) && tempPrevMonth == 01) {
            prevNumberOfDaysInMonth = leapYear
        }
        else {
            prevNumberOfDaysInMonth = daysInMonth[tempPrevMonth]
        }
        
        if ((Int(year)%4 == 0) && tempNextMonth == 01) {
            nextNumberOfDaysInMonth = leapYear
        }
        else {
            nextNumberOfDaysInMonth = daysInMonth[tempNextMonth]
        }
        
        //Gets the day of the week of the first date of the month
        monthStart = firstDayOfMonth(dayCounter: dayCounter, day: day)
        // Calculates first day of previous month
        prevMonthStart = firstDayOfMonth (dayCounter: monthStart, day: (1 + prevNumberOfDaysInMonth))
        // Calculates first day of next month
        nextMonthStart = nextFirstDayOfMonth (dayCounter: monthStart, day: (nextNumberOfDaysInMonth) )
        //Prints to make sure all days are correct
        //print("first day of month = \(monthStart), first day of previous month = \(prevMonthStart), first day of next month = \(nextMonthStart)")
        
        // If it's a leap year & the month is february, use days in a leap year
        if ((Int(year)%4 == 0) && month == 01) {
            numberOfDaysInMonth = leapYear
        }
            
            // Else, use days of month corresponding to month in array
        else {
            self.numberOfDaysInMonth = daysInMonth[month]
        }
        
        //Label at the top of calendar is displayed month + year
        monthLabel.text = (monthNames[month] + " " + String(year))
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    //Get day of week from date
    func getDayOfWeek(_ today:String) -> Int? {
        //todayDate = user's date
        let todayDate = date
        //Using Gregorian Calendar (Sunday = 01, Monday = 02, etc)
        let myCalendar =  NSCalendar(calendarIdentifier: NSCalendar.Identifier(rawValue: NSGregorianCalendar))!
        let weekDay = myCalendar.component(.weekday, from: (todayDate))
        // Returns current weekday
        return weekDay
    }
    
    
    //Find the weekday of the first day of the month through counting backwards (Used for current/previous month
    func firstDayOfMonth (dayCounter:Int, day:Int) -> Int {
        // dayCounter = weekday of current day
        var dayCounter = dayCounter
        // day = current day of month
        var day = day
        //Count down days of week until day of month gets to first
        //When day of week hits sunday, resets to saturday
        while day > 1 {
            dayCounter-=1
            if dayCounter == 0 {
                dayCounter = 7
            }
            day-=1
        }
        // Daycounter now represents weekday on which month starts
        return dayCounter
    }
    
    //Find the weekday of the first day of the month
    func nextFirstDayOfMonth (dayCounter:Int, day:Int) -> Int {
        // dayCounter = weekday of current day
        var dayCounter = dayCounter
        // day = current day of month
        var day = day
        //Count down days of week until day of month gets to first
        //When day of week hits sunday, resets to saturday
        while day > 1 {
            dayCounter+=1
            if dayCounter == 8 {
                dayCounter = 1
            }
            day-=1
        }
        // Daycounter now represents weekday on which month starts
        return dayCounter
    }
    
    
    // Create Cells
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 42 //Number of cells (7 days * 6 weeks)
    }
    
    
    // make a cell for each cell index path
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        //print("in editing for each cell")
        
        // get a reference to our storyboard cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CalendarCells", for: indexPath as IndexPath) as! CalendarCells
        
        // If cell is before the start of the month, label is left blank
        if indexPath.item < (monthStart - 1) {
            cell.daysLabel?.text = ""
        }
            // If the cell is within the month (between the first & last day), label will start at one and increase until hitting the number of days in the month
        else if indexPath.item < (numberOfDaysInMonth + monthStart - 1) {
            cell.daysLabel?.text = String(dayLabel)
            if dayLabel < numberOfDaysInMonth {
                dayLabel+=1
            }
        }
            // After printing the last day of the month, the rest of the cells are printed as blanks
        else {
            cell.daysLabel.text = ""
        }
        
        
        // Use the outlet in our custom class to get a reference to the UILabel in the cell
        //cell.BookCover.image = UIImage(named: arrayBookImages[indexPath.item])
        
        return cell
    }
    
    
    @IBAction func previousMonthButtonIsPressed(_ sender: Any) {
        
        //Reset dayLabel so label starts at 1
        dayLabel = 1
        // If month is not january, changes to previous month
        if month != 00 {
            month-=1
        }
            // If month is january, changes year and sets month to december
        else {
            month = 11
            year-=1
        }
        
        // recalculate number of days in month
        // If it's a leap year & the month is february, use days in a leap year
        if ((Int(year)%4 == 0) && month == 01) {
            numberOfDaysInMonth = leapYear
        }
            
            // Else, use days of month corresponding to month in array
        else {
            self.numberOfDaysInMonth = daysInMonth[month]
        }
        
        if tempPrevMonth != 00 {
            tempPrevMonth-=1
        }
            // If month is january, changes year and sets month to december
        else {
            tempPrevMonth = 11
        }
        
        if ((Int(year)%4 == 0) && tempPrevMonth == 01) {
            prevNumberOfDaysInMonth = leapYear
        }
        else {
            prevNumberOfDaysInMonth = daysInMonth[tempPrevMonth]
        }

       // print("Number of days in month = \(numberOfDaysInMonth); Number of days in previous month = \(prevNumberOfDaysInMonth)")
        
        
        if month == 00 {
            tempPrevMonth = 11
        }
        else {
            tempPrevMonth = (month-1)
        }
        if month == 11 {
            tempNextMonth = 00
        }
        else {
            tempNextMonth = (month+1)
        }
        
        //Gets the day of the week of the first date of the month
        nextMonthStart = monthStart
        monthStart = prevMonthStart
        // Calculates first day of previous month
        prevMonthStart = firstDayOfMonth (dayCounter: monthStart, day: (prevNumberOfDaysInMonth + 1))
        // Calculates first day of next month
       // print("first day of month = \(monthStart), first day of previous month = \(prevMonthStart), first day of next month = \(nextMonthStart)")
        
        
        monthLabel.text = (monthNames[month] + " " + String(year))
        
        //After all information has been changed, reload calendar display for new month
        CalendarCollectionView.reloadData()
        //print("Calendar Collection View has been reloaded")
    }
    
    @IBAction func nextMonthButtonIsPressed(_ sender: Any) {
        
        //Reset dayLabel so label starts at 1
        dayLabel = 1
        //If month is not december, changes to next month
        if month != 11 {
            month+=1
        }
            // if month is december, changes month to january and changes year
        else {
            month = 00
            year+=1
        }
        // recalculate number of days in month
        // If it's a leap year & the month is february, use days in a leap year
        if ((Int(year)%4 == 0) && month == 01) {
            numberOfDaysInMonth = leapYear
        }
            
            // Else, use days of month corresponding to month in array
        else {
            self.numberOfDaysInMonth = daysInMonth[month]
        }
        
        if tempNextMonth != 11 {
            tempNextMonth+=1
        }
            // If month is january, changes year and sets month to december
        else {
            tempNextMonth = 00
        }

        
        if ((Int(year)%4 == 0) && tempNextMonth == 01) {
            nextNumberOfDaysInMonth = leapYear
        }
        else {
            nextNumberOfDaysInMonth = daysInMonth[tempNextMonth]
        }

                //print("Number of days in month = \(numberOfDaysInMonth); Number of days in next month = \(nextNumberOfDaysInMonth); Next month = \(tempNextMonth)")
        
        if month == 00 {
            tempPrevMonth = 11
        }
        else {
            tempPrevMonth = (month-1)
        }
        if month == 11 {
            tempNextMonth = 00
        }
        else {
            tempNextMonth = (month+1)
        }
        
        //Gets the day of the week of the first date of the month
        prevMonthStart = monthStart
        monthStart = nextMonthStart
        nextMonthStart = nextFirstDayOfMonth (dayCounter: monthStart, day: (numberOfDaysInMonth+1) )
        //Prints to make sure all days are correct
       // print("first day of month = \(monthStart), first day of previous month = \(prevMonthStart), first day of next month = \(nextMonthStart)")
        
        
        
        monthLabel.text = (monthNames[month] + " " + String(year))
        
        //After all information has been changed, reload calendar display for new month
        CalendarCollectionView.reloadData()
        //print("Calendar Collection View has been reloaded")
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
