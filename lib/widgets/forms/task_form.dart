import 'package:flutter/cupertino.dart';

class TaskForm extends StatelessWidget {
  final String                  title;         
  final String?                 description;   
  final DateTime                deadline;      
  final void Function(String)   setTitle;      
  final void Function(String)   setDescription;
  final void Function(DateTime) setDeadline;   
  final VoidCallback            submit;        


 const TaskForm({
    super.key,
    required this.title,
    required this.description,
    required this.deadline,
    required this.setTitle,
    required this.setDescription,
    required this.setDeadline,
    required this.submit,
  }) : super();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: const Color(0xFFFFFFFF),
        boxShadow: const [
          BoxShadow(
            color: Color(0x08000000),
            blurRadius: 8,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            (title == null ? 'Add Task' : 'Edit Task'),
            style: const TextStyle(
              fontSize: 20.0,
              color: Color(0xFFCDB4DB),
            ),
          ),
          const SizedBox(height: 20.0),
          CupertinoTextField(
            placeholder: (title ?? 'Title'),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: const Color(0xFFF0F0F0),
            ),
            onChanged: setTitle,
          ),
          const SizedBox(height: 20.0),
          CupertinoTextField(
            placeholder: (description ?? 'Description'),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: const Color(0xFFF0F0F0),
            ),
            onChanged: setDescription,
          ),
          const SizedBox(height: 20.0),
          CupertinoButton(
            onPressed: () {
              showCupertinoModalPopup(
                context: context,
                builder: (context) => Container(
                  height: 200.0,
                  child: CupertinoDatePicker(
                    backgroundColor: const Color(0xFFFFFFFF),
                    mode: CupertinoDatePickerMode.date,
                    onDateTimeChanged: setDeadline,
                  ),
                ),
              );
            },
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: const Color(0xFFF0F0F0),
              ),
              child: Row(
                children: <Widget>[
                  const Text(
                    'Deadline',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Color(0xFFA0A0A0),
                    ),
                  ),
                  const Spacer(),
                  Text(
                    '${deadline.year}-${deadline.month}-${deadline.day}',
                    style: const TextStyle(
                      fontSize: 16.0,
                      color: Color(0xFFCDB4DB),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20.0),
          CupertinoButton(
            onPressed: submit,
            child: Container(
              width: double.infinity,
              height: 50,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.elliptical(25, 25)),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFFCDB4DB),
                    Color(0xFFAE93BE),
                  ],
                ),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFFBEA8CB),
                    blurRadius: 12,
                    offset: Offset(0, 10),
                  ),
                ],
              ),
              child: const Center(
                child: Text(
                  'Add',
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFFFFFFFF),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
