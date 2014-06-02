@IsTest
public class TestData {
    public static Task task;

  public static void insertTasks() {
    insert new List<Task>{
      new Task(
        Priority   = 'normal',
        Subject = 'test',
        ActivityDate = Date.newInstance(2008,12,31),
        Status = 'Deferred'
      ),
      new Task(
        Priority   = 'normal',
        Subject = 'test2',
        ActivityDate = Date.newInstance(2008,12,31),
        Status = 'completed'
      )
     
    };
  }
  public static Task newInstanceOfTask() {
    return new Task(
        Priority   = 'normal',
        Subject = 'test3',
        ActivityDate = Date.newInstance(2008,12,31),
        Status = 'In Progress'
    );
  }
}