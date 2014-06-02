@isTest
public class TesttaskItem {
public static Task task;

static testMethod void taskItem(){
     task = TestData.newInstanceOfTask();

     System.Test.startTest();
     taskItem ctrl = new taskItem(task);

     ctrl.getTs();
     System.AssertEquals(task.Subject, 'test3');
     ctrl.getFormatedDate();
     System.AssertEquals(task.ActivityDate, Date.ValueOf('2008-12-31'));
     
    }

}