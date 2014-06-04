public class Month {
    private List<Week> weeks; 
    public Date firstDate; // always the first of the month
    private Date upperLeft; 
    private Integer taskSize {get; set;}
    private Integer compTaskSize {get; set;}   
    private Boolean compCheck {get; set;}
    public static final string COMP_STATUS  = System.Label.COMP_STATUS;
    
    public List<Date> getValidDateRange() { 
        // return one date from the upper left, and one from the lower right
        List<Date> ret = new List<Date>();
        ret.add(upperLeft);
        ret.add(upperLeft.addDays(5*7) );
        return ret;
    }
    
    public String getMonthName() { 
        return DateTime.newInstance(firstDate.year(),firstdate.month(),firstdate.day()).format('MMMM');
    } 
    
    public String getYearName() { 
        return DateTime.newInstance(
        firstDate.year(),firstdate.month(),firstdate.day()).format('yyyy');
    } 
    
    public String[] getWeekdayNames() { 
        Date today = system.today().toStartOfWeek();
        DateTime dt = DateTime.newInstanceGmt(today.year(),today.month(),today.day());      
        list<String> ret = new list<String>();
        for(Integer i = 0; i < 7;i++) { 
            ret.add( dt.formatgmt('EEEE') );
            dt= dt.addDays(1);
        } 
        return ret;
    }
    
    public Date getfirstDate() { return firstDate; } 

    public Month( Date value ) {
        weeks = new List<Week>();
        firstDate = value.toStartOfMonth();
        upperLeft = firstDate.toStartOfWeek();
        Date tmp = upperLeft;
        for (Integer i = 0; i < 5; i++) {
            Week w = new Week(i+1,tmp,value.month());   
            system.assert(w!=null); 
            this.weeks.add( w );
            tmp = tmp.addDays(7);
        }

    }

    public Boolean setAllCompletedCheck (Integer tasksize, Integer compTasksize) {
     if (tasksize == compTasksize && tasksize != 0 ) {
         compCheck = true;
         return true;
     }
      compCheck = false;
      return false;
    }

    public Boolean getCompletedCheck () {
        return compCheck;
    }

    public void setTasks(List<Task> ev) { 
        // merge these tasks into the proper day 
        for(Task e:ev) { 
            for(Week w:weeks) { 
                for(Day c: w.getDays() ) { 
                    if ( e.ActivityDate.isSameDay(c.theDate))  { 
                        //add this task to this calendar date
                        if( e.Status == COMP_STATUS ) {
                            c.tasksCompleteToday.add(new TaskItem(e));
                        } else if ( e.Status != COMP_STATUS && e.ActivityDate < Date.today() ) {
                            c.tasksIncompleteToday.add(new TaskItem(e));
                        } else {
                            c.tasksToday.add(new TaskItem(e));
                        }        
                    } 
                } 
            } 
        }
    }
    
    public List<Week> getWeeks() { 
        system.assert(weeks!=null,'could not create weeks list');
        return this.weeks; 
    }
        

    /* 
     * helper classes to define a month in terms of week and day
     */
    public class Week {
     public List<Day> days;
     public Integer weekNumber; 
     public Date startingDate; 

     public List<Day> getDays() { return this.days; }
     
     public Week () { 
        days = new List<Day>();     
     }
     public Week(Integer value,Date sunday,Integer month) { 
        this();
        weekNumber = value;
        startingDate = sunday;
        Date tmp = startingDate;
        for (Integer i = 0; i < 7; i++) {
            Day d = new Day( tmp,month ); 
            tmp = tmp.addDays(1);
            d.dayOfWeek = i+1;          
            days.add(d);
        } 
        
     }
     public Integer getWeekNumber() { return this.weekNumber;}
     public Date getStartingDate() { return this.startingDate;}
     
    }
    
    public class Day {
         
        public Date         theDate;
        public List<TaskItem>   tasksToday; // list of events for this date
        //完了、未完了
        public List<TaskItem>   tasksCompleteToday; // list of events for this date
        public List<TaskItem>   tasksIncompleteToday; // list of events for this date
        public Integer      month, dayOfWeek;
        public String       formatedDate; // for the formated time  
        private String      cssclass = 'calActive';
        public Date         getDate() { return theDate; }
        public Integer      getDayOfMonth() { return theDate.day(); }
        public String       getDayOfMonth2() { 
            if ( theDate.day() <= 9 ) 
                return '0'+theDate.day(); 
            return String.valueof( theDate.day()); 
        }

        //number of tasks
        public Boolean  getHasTask() { 
            if ( tasksToday.size() > 0 ) 
                return true; 
            return false; 
        }

        public Boolean  getHasCompleteTask() { 
            if ( tasksCompleteToday.size() > 0 && tasksToday.size() == 0 && tasksCompleteToday.size() > 0 && tasksIncompleteToday.size() == 0) 
                return true; 
            return false; 
        }

        public Boolean  getHasIncompleteTask() { 
            if ( tasksIncompleteToday.size() > 0 ) 
                return true; 
            return false; 
        }
        
        public Integer getDayOfYear() { return theDate.dayOfYear(); }

        public String       getFormatedDate() { return formatedDate; }
        public Integer      getDayNumber() { return dayOfWeek; }
        public List<TaskItem>  getTasksToday() { return tasksToday; }
        public String       getCSSName() {  return cssclass; }
        
        public Day(Date value,Integer vmonth) { 
            theDate=value; month=vmonth;        
            formatedDate = '12 21 08';// time range..
            tasksToday = new List<TaskItem>();
            //完了、未完了
            tasksCompleteToday = new List<TaskItem>();
            tasksIncompleteToday = new List<TaskItem>();
            // three possible Inactive,Today,Active  
            if ( theDate.daysBetween(System.today()) == 0 ) cssclass ='calToday';
            // define inactive, is the date in the month?
            if ( theDate.month() != month) cssclass = 'calInactive';
        }
            
    }


}