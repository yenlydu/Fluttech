import 'package:flutter/material.dart';
import 'package:flutter2/Web/Navigation/HandleProjects/ProjectInformation.dart';

class EditGroup extends StatefulWidget {
  final ProjectInformation projectInformation;

  const EditGroup({Key key, this.projectInformation, }) : super(key: key);

  @override
  _EditGroupState createState() => _EditGroupState();
}

class _EditGroupState extends State<EditGroup> {

  @override
  Widget build(BuildContext context) {
    // MAXIME : la liste text représente le nom des étudiants, il faut récupérer
    return AlertDialog(
        title: Text("Edit group", style: TextStyle(color: Color(0xFF875BC5),fontSize: 19,fontFamily: "Montserrat-Italic", fontWeight: FontWeight.bold, ),),

        content:             Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 500,
                    height: 200,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: widget.projectInformation.teammates.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          title:
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      // MAXIME
                                      widget.projectInformation.teammates[index].image,
                                      SizedBox(width: 5,),
                                      Text('${widget.projectInformation.teammates[index].mail}'),
                                    ],
                                  ),
                                  Icon(Icons.person_remove_alt_1, color: Color(0xFF875BC5)),
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
