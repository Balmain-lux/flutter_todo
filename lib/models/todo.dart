class Todo {
    String? title;
    String? description;
    DateTime? dateTime;

    Todo({this.title, this.description, this.dateTime});
}


List<Todo>? newTodoList=[];
List<Todo?> todoList = [
    Todo(
        title: 'Дело 1',
        description: "Вечерняя прогулка",
        dateTime: DateTime.now(),
    ),
    Todo(
        title: 'Дело 1',
        description: "Вечерняя прогулка",
        dateTime: DateTime.now(),
    ),
    Todo(
        title: 'Дело 1',
        description: "Вечерняя прогулка",
        dateTime: DateTime.now(),
    ),
];