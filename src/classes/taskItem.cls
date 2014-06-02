public class taskItem {
    public Task ts;
    public String formatedDate; 
    public taskItem(Task t) { 
        ts= t;
        // build formated date
        Datetime endd = t.activitydate;
        formatedDate = String.ValueOf(t.activitydate);
        system.debug(formateddate);
    }
    public Task getTs() { return ts; }
    public String getFormatedDate() { return formatedDate; }

}