@isTest
public class TestMonth {
    //public static testMethod void testMonth() {

static testMethod void Month(){
        Month m = new Month( Date.newInstance(2007,11,1) );
        system.assert(m!=null); 
        //List<Week> l = m.getWeeks(); 
        //repeatcon r = new repeatcon(); 
        system.debug(m.getMonthName());
        //Month mm = r.getMonth();
        //system.debug(mm); 
        system.debug(m.getFirstDate());
        system.debug(m.getWeekdayNames());
        /*
        for(Week w:r.getWeeks()) { 
            for(Day c:w.days) {   
                if (c.tasksToday.size() > 0 ) { 
                    String ss = String.valueOf(c.tasksToday[0].ev.ActivityDate);
                    ss = c.eventsToday[0].ev.ActivityDateTime.format('MMMM a');
                    //system.debug(ss);
                    //system.debug(c.eventsToday[0].ev);
                } 
            } 
        } 
        */
        m.getValidDateRange();
        m.getYearName();
        m.getWeeks();
        //m.getHasTask();
        //m.getHasCompleteTask();
        //m.getHasUncompleteTask();
        //m.getDayOfYear();
        //m.getFormatedDate();
        //m.getDayNumber();
        //m.getTasksToday();
        //m.getCSSName();
        
        
        
        
    }
 
}