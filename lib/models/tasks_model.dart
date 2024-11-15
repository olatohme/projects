// To parse this JSON data, do
//
//     final tasks = tasksFromJson(jsonString);

import 'dart:convert';

Tasks tasksFromJson(String str) => Tasks.fromJson(json.decode(str));

String tasksToJson(Tasks data) => json.encode(data.toJson());

class Tasks {
    MyTasks myTasks;

    Tasks({
        required this.myTasks,
    });

    factory Tasks.fromJson(Map<String, dynamic> json) => Tasks(
        myTasks: MyTasks.fromJson(json["my tasks"]),
    );

    Map<String, dynamic> toJson() => {
        "my tasks": myTasks.toJson(),
    };
}

class MyTasks {
    int id;
    String name;
    String email;
    int phone;
    String profileImageUrl;
    dynamic isActive;
    List<Task> tasks;

    MyTasks({
        required this.id,
        required this.name,
        required this.email,
        required this.phone,
        required this.profileImageUrl,
        required this.isActive,
        required this.tasks,
    });

    factory MyTasks.fromJson(Map<String, dynamic> json) => MyTasks(
       id: json["id"] ?? 0,
      name: json["name"] ?? "",
      email: json["email"] ?? "",
      phone: json["phone"] ?? 0,
      profileImageUrl: json["profile_image_url"] ?? "",
      isActive: json["is_active"], // dynamic type allows null by default
      tasks: json["tasks"] != null
          ? List<Task>.from(json["tasks"].map((x) => Task.fromJson(x)))
          : [], // Handle null case for tasks list
    );

    Map<String, dynamic> toJson() => {
        "id": id,
    "name": name,
    "email": email,
    "phone": phone,
    "profile_image_url": profileImageUrl,
    "is_active": isActive,
    "tasks": List<dynamic>.from(tasks.map((x) => x.toJson())),
    };
}

class Task {
    int id;
    String title;
    String description;
    String priority;
    DateTime dueDate;
    bool completed;

    Task({
        required this.id,
        required this.title,
        required this.description,
        required this.priority,
        required this.dueDate,
        required this.completed,
    });

    factory Task.fromJson(Map<String, dynamic> json) => Task(
      id: json["id"] ?? 0,
      title: json["title"] ?? "",
      description: json["description"] ?? "",
      priority: json["priority"] ?? "",
       dueDate: DateTime.parse(json["due_date"]),
      completed: json["completed"] ?? false,
       
       
       
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "priority": priority,
        "due_date": dueDate.toIso8601String(),
        "completed": completed,
    };
}
