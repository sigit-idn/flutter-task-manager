import 'package:flutter/cupertino.dart';

class ChunkForm extends StatelessWidget {
  final String?                 title;         
  final void Function(String)   setTitle;      
  final VoidCallback            submit;        

  const ChunkForm({
    super.key,
    required this.title,
    required this.setTitle,
    required this.submit,
  }) : super();

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Container(
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
              (title == null ? 'Add Chunk' : 'Edit Chunk'),
              style: const TextStyle(
                fontSize: 20.0,
                color: Color(0xFFCDB4DB),
              ),
            ),
            const SizedBox(height: 20.0),
            CupertinoTextFormFieldRow(
              controller: TextEditingController(text: title),
              placeholder: 'Title',
              onChanged: setTitle,
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Color(0xFFCDB4DB),
                    width: 0.0,
                  ),
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
                    'Submit',
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
      ),
    );
  }
}
