//
//  InsightsBuilder.swift
//  CareCard
//
//  Created by William McCoy on 5/21/16.
//  Copyright © 2016 William McCoy. All rights reserved.
//

import CareKit

class InsightsBuilder {
    
    /// An array if `OCKInsightItem` to show on the Insights view.
    private(set) var insights = [OCKInsightItem.emptyInsightsMessage()]
    
    private let carePlanStore: OCKCarePlanStore
    
    private let updateOperationQueue = NSOperationQueue()
    
    required init(carePlanStore: OCKCarePlanStore) {
        self.carePlanStore = carePlanStore
    }
    
    /**
     Enqueues `NSOperation`s to query the `OCKCarePlanStore` and update the
     `insights` property.
     */
    func updateInsights(completion: ((Bool, [OCKInsightItem]?) -> Void)?) {
        // Cancel any in-progress operations.
        updateOperationQueue.cancelAllOperations()
        
        // Get the dates the current and previous weeks.
        let queryDateRange = calculateQueryDateRange()
        
        /*
         Create an operation to query for events for the previous week's
         `TakeMedication` activity.
         */
        
        
        /*
         Create a `BuildInsightsOperation` to create insights from the data
         collected by query operations.
         */
   
    }
    
    private func calculateQueryDateRange() -> (start: NSDateComponents, end: NSDateComponents) {
        let calendar = NSCalendar.currentCalendar()
        let now = NSDate()
        
        let currentWeekRange = calendar.weekDatesForDate(now)
        let previousWeekRange = calendar.weekDatesForDate(currentWeekRange.start.dateByAddingTimeInterval(-1))
        
        let queryRangeStart = NSDateComponents(date: previousWeekRange.start, calendar: calendar)
        let queryRangeEnd = NSDateComponents(date: now, calendar: calendar)
        
        return (start: queryRangeStart, end: queryRangeEnd)
    }
}



protocol InsightsBuilderDelegate: class {
    func insightsBuilder(insightsBuilder: InsightsBuilder, didUpdateInsights insights: [OCKInsightItem])
}
