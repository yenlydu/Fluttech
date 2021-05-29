import 'package:flutter/material.dart';

class EditGroup extends StatefulWidget {
  const EditGroup({Key key}) : super(key: key);

  @override
  _EditGroupState createState() => _EditGroupState();
}

class _EditGroupState extends State<EditGroup> {
  List<String> group = [];
  List<Icon> studentsPicture = [];

  void getStudents()
  {
    group.add("Student a");
    group.add("Student b");
    group.add("Student c");
    group.add("Student d");

    studentsPicture.add(Icon(
      Icons.favorite,
      color: Colors.pink,
      size: 24.0,
      semanticLabel: 'Text to announce in accessibility modes',
    ),);
    studentsPicture.add(Icon(
      Icons.add,
      color: Colors.amberAccent,
      size: 24.0,
      semanticLabel: 'Text to announce in accessibility modes',
    ),);
    studentsPicture.add(Icon(
      Icons.baby_changing_station,
      color: Colors.blue,
      size: 24.0,
      semanticLabel: 'Text to announce in accessibility modes',
    ),);
    studentsPicture.add(Icon(
      Icons.cached,
      color: Colors.cyan,
      size: 24.0,
      semanticLabel: 'Text to announce in accessibility modes',
    ),);
    // MAXIME : Ici, récupérer les datas de l'étudiant en groupe avec (nom et l'image et peut etre changer le type) et le mettre dans la map retournée
  }
  @override
  Widget build(BuildContext context) {
    getStudents();
    // MAXIME : la liste text représente le nom des étudiants, il faut récupérer
    return AlertDialog(
        title: Text('AlertDialog Title'),
        content:             Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 500,
                    height: 200,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: group.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          title:


                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                        // MAXIME
                              studentsPicture[index],
                              Text('${group[index]}')
                            ],
                          )
                        );
                      },
                    )
                )
              ]

            )
      );
  }
}
