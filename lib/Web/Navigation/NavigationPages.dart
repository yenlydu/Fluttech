import 'package:flutter/material.dart';
import 'package:flutter2/Web/Navigation/HandleProjects/HandleUnits/HandleUnits.dart';
import 'package:flutter2/Web/UnitsInformation.dart';
import 'package:flutter2/Web/WebConstants/WebConstants.dart';
import 'package:flutter2/Web/WebConstants/responsiveLayout.dart';
import 'package:flutter2/Web/Navigation/ButtonsActions/CreateProject/CreateProjectButton.dart';
import 'package:http/http.dart' as http;
import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class AllProjects extends StatefulWidget {
  final getUnits;
  const AllProjects({Key key, this.getUnits}) : super(key: key);

  @override
  _AllProjectsState createState() => _AllProjectsState();
}
class _AllProjectsState extends State<AllProjects>
{
  static List <UnitInformation> units;
  Future my;
  @override
  void initState() {
    super.initState();
    my = getFirebaseUnits();

  }

  Widget loadData()
  {
    return FutureBuilder(
        future: my,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          List<Widget> children;
          if (snapshot.connectionState != ConnectionState.done) {
            children = <Widget>[
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SpinKitFadingCube(color: Colors.deepPurple),
                    const Padding(
                      padding: EdgeInsets.only(top: 16),
                      child: Text('Awaiting result...'),
                    )

                  ],
                ),
              )
            ];
          } else if (snapshot.hasError) {

            children = <Widget>[
              Icon(
                Icons.error_outline,
                color: Colors.red,
                size: 60,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child:
                Text('Error: ${snapshot.error}'),

              )
            ];
          } else {
            children = <Widget>[
              tes(context)
            ];
          }
          return Container(
              child: Padding(
                  padding: EdgeInsets.all(40.0),
                  child: Container(
                      height: MediaQuery.of(context).size.height / 3* 1.8,
                      child: Stack(
                          children:
                          children
                      )
                  )
              )
          );
        }
    );
  }

  Future<void> getFirebaseUnits() async {
    print("entering");
    final res = await http.get(Uri.parse('https://us-central1-flutter2-f9a8c.cloudfunctions.net/getUnits'));
    print('[onRequest] Res: ${res.body.toString()}');
    units = parseUnits(res.body);
    for(var i = 0; i < units.length; i++){
      print ("TESTING");
      print (units[i].toString());
      print("\n");
    }
  }

  FirebaseFunctions functions = FirebaseFunctions.instance;
  //MAXIME : récuperer les units sous forme de list d'Unit information

  Widget tes(BuildContext context) {
    if (!ResponsiveLayout.isSmallScreen(context)) {
      return Container(
//          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height/1.3,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CreateModuleButton(),
              HandleUnits(unitInformation: units)
                  .constructProjectsList(40, context),
            ],
          )
      );
    }
    else{
      return Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CreateModuleButton(height: 50,width: 140,),
              Flexible(child:               HandleUnits(unitInformation: units)
                  .constructProjectsList(40, context),
              )
            ],
          )
      );
    }

  }

  @override
  Widget build(BuildContext context)  {
    widget.getUnits != null ? widget.getUnits(units): Container();
    return loadData();
  }
}