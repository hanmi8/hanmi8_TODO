import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widgets/custom_text_form_field.dart';
import '../customDrawer.dart';
import '../domain/memberProvider.dart';
import '../todo/todoList_listView.dart';

import '../domain/Todo.dart';
import '../utils/spaces.dart';
import '../utils/values.dart';
import '../widgets/custom_button.dart';

class TodoListScreen extends StatefulWidget {
  @override
  _TodoListScreenState createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  List<Todo> todos = [
     Todo(title: "과제하기"),
     Todo(title: "영어 공부"),
     Todo(title: "청소하기"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: Sizes.ELEVATION_1,
        backgroundColor: AppColors.blue,
        title: Text(
          'TODO',
          style: TextStyle( color: Colors.white),
        ),
        iconTheme: IconThemeData(
          color: Colors.white, // 뒤로 가기 화살표 색상 설정
        ),
      ),
      body: TodoList(
        todos: todos,
        onRemoveTodo: _removeTodo,
        onToggleTodo: _toggleTodo,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.blue,
        onPressed: () => _addTodo(),
        child: Icon(Icons.add_task, color: Colors.white),
      ),
      endDrawer: CustomDrawer(),
    );
  }

  void _addTodo() async {
    final TextEditingController controller = TextEditingController();

    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("할 일 추가"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              CustomTextFormField(
                hasPrefixIcon: true,
                textInputType:  TextInputType.text,
                hintText: "제목을 입력하세요",
                hintTextStyle: Styles.customTextStyle(fontWeight: FontWeight.w200),
                textStyle: Styles.customTextStyle(),
                prefixIcon: Icon(Icons.add_task, color:AppColors.blue, size: Sizes.ICON_SIZE_20),
                controller: controller,
              ),
            ],
          ),
          actions: <Widget>[
            Row(
              children: [
                SpaceW8(),
                Expanded(
                  child: CustomButton(
                    title: "추가",
                    height:48,
                    color: AppColors.blue,
                    textStyle: TextStyle(color: AppColors.white, fontSize: 18),
                    onPressed: () {
                      setState(() => todos.add(Todo(title: controller.text)));
                      Navigator.of(context).pop();
                      log.i('controller >>>>>>>> ' + controller.text);
                    },
                  ),
                ),
                SpaceW8(),
                Expanded(
                  child: CustomButton(
                    title: "취소",
                    height:48,
                    color: AppColors.grey,
                    textStyle: TextStyle(color: AppColors.white, fontSize: 18),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ),
                SpaceW8(),
              ],
            ),
          ],
        );
      },
    );
  }
  void _removeTodo(int index) async {
    Todo temp = todos[index];
    setState(() => todos.removeAt(index));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("할 일 목록이 삭제 되었습니다."),
        action: SnackBarAction(
          label: "삭제 취소",
          onPressed: () {
            setState(() {
              todos.insert(index, Todo(title:temp.title, isDone:temp.isDone));
            });
          },
        ),
      ),
    );
  }
  void _toggleTodo(int index) async {
    setState(() {
      todos[index].isDone = !todos[index].isDone;
    });
  }
}