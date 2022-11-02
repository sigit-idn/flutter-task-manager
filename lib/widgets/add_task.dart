import 'package:flutter/cupertino.dart';
import 'package:flutter_task_manager/screens/home_screen.dart';

class _AddTaskModalState extends State<AddTaskModal> {
  String _title = '';
  String _description = '';
  DateTime _deadline = DateTime.now();

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
          const Text(
            'Add Task',
            style: TextStyle(
              fontSize: 20.0,
              color: Color(0xFFCDB4DB),
            ),
          ),
          const SizedBox(height: 20.0),
          CupertinoTextField(
            placeholder: 'Title',
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: const Color(0xFFF0F0F0),
            ),
            onChanged: (value) {
              setState(() {
                _title = value;
              });
            },
          ),
          const SizedBox(height: 20.0),
          CupertinoTextField(
            placeholder: 'Description',
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: const Color(0xFFF0F0F0),
            ),
            onChanged: (value) {
              setState(() {
                _description = value;
              });
            },
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
                    onDateTimeChanged: (DateTime value) {
                      setState(() {
                        _deadline = value;
                      });
                    },
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
                    '${_deadline.year}-${_deadline.month}-${_deadline.day}',
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
            onPressed: () {
              Navigator.pop(context);
            },
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

class AddTaskModal extends StatefulWidget {
  const AddTaskModal({super.key});

  @override
  _AddTaskModalState createState() => _AddTaskModalState();
}
