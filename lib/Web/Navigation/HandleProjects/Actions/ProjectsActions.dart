import 'package:flutter/material.dart';
import 'package:flutter2/Web/Navigation/HandleProjects/ProjectInformation.dart';
import 'package:flutter2/Web/WebConstants/WebConstants.dart';
import 'package:flutter2/Web/WebConstants/Enumerations.dart';
import 'package:intl/intl.dart';
import 'package:flutter2/Web/Navigation/HandleProjects/Actions/AllActions.dart';

class ProjectsActions extends StatefulWidget
{
  final ProjectActionsEnum actions;
  final ProjectInformation project;

  ProjectsActions({@required this.project, @required this.actions});

  @override
  ProjectsActionsState createState() => ProjectsActionsState();
}

class ProjectsActionsState extends State<ProjectsActions>
{
  DateTime beginDate ;
  DateTime endDate;
  List<Widget> widgets = [];

  Widget addStudent()
  {
    return AlertDialog(
      content: Text("Adding student to project " + widget.project.title),
    );
  }

  Widget delete()
  {
    return deleteAction(widget.project, context);
  }

  Widget edit()
  {
    return AlertDialog(
      content: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children:[
          Container(
            width: MediaQuery.of(context).size.width/2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center, //Center Column contents vertically,
              crossAxisAlignment: CrossAxisAlignment.center ,//Center Column contents horizontally,
              children:[
                Text("Editing", style: TextStyle(color: Color(0xFF875BC5),fontSize: 21,fontFamily: "Montserrat", fontWeight: FontWeight.bold,    decoration: TextDecoration.underline,),),
                Text(" : " + widget.project.title, style: TextStyle(fontFamily: "Montserrat-Italic", fontSize: 18),),

              ],
            ),
          ),
          sizedBox(20),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,

              children:[
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Description',
                  ),
                ),
                sizedBox(30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(DateFormat('yyyy-MM-dd – H:mm').format(beginDate)),
                    Text(DateFormat('yyyy-MM-dd – H:mm').format(endDate))
                  ],
                ),
                sizedBox(10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    RaisedButton(
                      onPressed: () {
                        showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.fromDateTime(beginDate)
                          ,
                        ).then((hour) => {
                          setState((){
                            var newHour = new DateTime(beginDate.year, beginDate.month, beginDate.day, hour.hour, hour.minute);
                            beginDate = newHour;
                            widget.project.beginDate = newHour;
                          })
                        });
                        showDatePicker(
                            context: context,
                            initialDate: beginDate,
                            firstDate: DateTime(2010),
                            lastDate: DateTime(2030)
                        ).then((date) => {
                          setState(() {
                            beginDate = date;
                            widget.project.beginDate = date;
                          })
                        });

                      },
                      child: Text("Pick Begin Date"),
                    ),
                    RaisedButton(
                      onPressed: () {
                        showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.fromDateTime(endDate)
                          ,
                        ).then((hour) => {
                          setState((){
                            var newHour = new DateTime(endDate.year, endDate.month, endDate.day, hour.hour, hour.minute);
                            endDate = newHour;
                            widget.project.endDate = newHour;
                          })
                        });

                        showDatePicker(
                            context: context,
                            initialDate: endDate,
                            firstDate: DateTime(2010),
                            lastDate: DateTime(2030)
                        ).then((date) => {
                          setState(() {
                            endDate = date;
                            widget.project.endDate = date;
                          })
                        });
                      },
                      child: Text("Pick End Date"),
                    ),
                  ],

                ),
              ],
            ),
          )

        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    setState(() {
    });
    // TODO: implement initState
  }
  @override
  Widget build(BuildContext context)
  {
    beginDate = widget.project.beginDate;
    endDate = widget.project.endDate;
    switch(widget.actions.index) {
      case 0: {
        return delete();
      }
      break;

      case 1: {
        return edit();
      }
      break;
      case 2: {
        return addStudent();
      }
      break;
    }
    return Container();
  }
}