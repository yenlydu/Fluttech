import 'package:flutter/material.dart';
import 'package:flutter2/Web/WebConstants/Enumerations.dart';

class RolesDropDown extends StatefulWidget {
  final String text;
  final getUserRole;
  RolesDropDown({Key key, this.text, this.getUserRole}) : super(key: key);
  @override
  _RolesDropDownState createState() => _RolesDropDownState();
}

class _RolesDropDownState extends State<RolesDropDown> {
  bool isDropDownOpened = false;
  GlobalKey key;
  OverlayState _overlayState;
  Roles select = Roles.STUDENT;
  IconData iconData= Icons.arrow_drop_down_outlined;
  double height, width, xPosition, yPosition ;
  OverlayEntry floatingDropDown;

  void didSelected(Roles selectedRole)
  {
    setState(() {
      select = selectedRole;
    });
    widget.getUserRole(select);
    print (selectedRole.toString());
    hideHelp();
  }

  OverlayEntry _createFloatingDropdown()
  {
    return OverlayEntry(
      builder: (context) =>GestureDetector(

        behavior: HitTestBehavior.translucent,
        child: Stack(
          children: [
            Positioned(        left: xPosition,
              width: width,
              top: yPosition + height,
              height: 4 * height + 40,

              child:DropDown(
                didSelected: didSelected,
                itemHeight: height,
              ),
            ),],
        )
        ,          onTap: () {
        hideHelp();
      },
      ),
    );
  }

  void findDropDownDate()
  {
    RenderBox renderBox = key.currentContext.findRenderObject();
    height = renderBox.size.height;
    width = renderBox.size.width;
    Offset offset = renderBox.localToGlobal(Offset.zero);
    xPosition = offset.dx;
    yPosition = offset.dy;
    print(height);
  }

  Widget content()
  {
    return Container(
        width: 270,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF693D92), Color(0xFFAC84D1), Color(0xFFD9CEE3)],
          ),
        ),
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          children: [
            Text(
              widget.text.toUpperCase(),
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
            Spacer(),
            Icon(iconData, color: Colors.white,)
          ],
        )

    );
  }

  showHelp() async {
    if (!isDropDownOpened) {
      _overlayState = Overlay.of(context);
      floatingDropDown = _createFloatingDropdown();
      _overlayState.insert(floatingDropDown);
      isDropDownOpened = true;
    }
  }

  void hideHelp() {
    setState(() {
      iconData = Icons.arrow_drop_down_outlined;
    });
    isDropDownOpened = false;
    floatingDropDown.remove();
  }
  @override
  void initState() {
    super.initState();
    // TODO: implement initState
    key = LabeledGlobalKey(widget.text);
  }
  Widget build(BuildContext context) {
    return Row(
      key: key,
      children: [
        Center(
          child: GestureDetector(
            child: content(),
            onTap: () {
              setState(() {
                iconData = Icons.arrow_left_outlined;
              });
              findDropDownDate();
              showHelp();
            },
          ),
        )
      ],
      mainAxisAlignment: MainAxisAlignment.end,
    );
  }


/*
    return GestureDetector(
      key: key,
      onTap: () {
        setState(() {
          if (isDropDownOpened)
            {
              floatingDropDown.remove();
            }
          else{
            findDropDownDate();
            floatingDropDown = _createFloatingDropdown();
            Overlay.of(context).insert(floatingDropDown );
          }

          isDropDownOpened = !isDropDownOpened;
        });
      },
      child:     Container(
        width: 250,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        height: 35,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF693D92), Color(0xFFAC84D1), Color(0xFFD9CEE3)],
          ),
        ),
        child: Row(
          children: [
            Text(widget.text.toUpperCase(), style: TextStyle(color: Colors.white),),
            Spacer(),
            Icon(Icons.arrow_drop_down_sharp, color: Colors.white,),
          ],
        ),
      )
    );
*/
}

class DropDown extends StatelessWidget {
  final double itemHeight;
  final didSelected;
  DropDown({Key key, this.itemHeight, this.didSelected}): super(key: key);

  void function(Roles string)
  {
/*
    if (string == Roles.STUDENT) {
      print("Student");
    }
    else if (string == Roles.ADMINISTRATOR) {

      print("ADMINISTRATOR");
    } else {
      print("teacher");
    }
*/
    this.didSelected(string);
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment(-0.85,0.4),
          child:         ClipPath(
            clipper: ArrowClipper(),
            child:         Container(
              height: 10,
              width: 20,
              decoration: BoxDecoration(
                color: Color(0xFF704699),
              ),
            )
            ,
          )
          ,
        ),
        Material(
            type: MaterialType.transparency,
            child: Container(
              height: 4*itemHeight,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
              ),
              child: Column(
                children: [
                  DropDownItem.first(text: "Student", iconData: Icons.school,function: function,current: Roles.STUDENT,),
                  DropDownItem.second(text: "Teacher",iconData: Icons.assignment_ind_rounded,function: function,current: Roles.TEACHER,),
                  DropDownItem.last(text: "Administrator", iconData: Icons.settings,function: function,current: Roles.ADMINISTRATOR,)
                ],
              ),
            )
        ),
      ],

    );
  }
}

class DropDownItem extends StatelessWidget {
  final String text;
  final IconData icon;
  final bool isSelected;
  final bool isFirstItem;
  final bool isLastItem;
  final Roles currentRole;
  final function;

  factory DropDownItem.first({String text, IconData iconData,  function, Roles current}){
    return DropDownItem(
      text: text,
      icon: iconData,
      isFirstItem: true ,
      function: function,
      currentRole: current,
    );
  }
  factory DropDownItem.second({String text, IconData iconData,  function, Roles current}){
    return DropDownItem(
        text: text,
        function: function,
        icon: iconData,
        currentRole: current
    );
  }
  factory DropDownItem.last({String text, IconData iconData, function,Roles current}){
    return DropDownItem(
      text: text,
      function: function,
      icon: iconData,
      isLastItem: true,
      currentRole: current,
    );
  }
  const DropDownItem({Key key, this.text, this.isSelected, this.icon,      this.isFirstItem = false,
    this.isLastItem = false, this.function, this.currentRole
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
        onTap: ()=> {
          function(currentRole),
        },
        child:       Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(top: isFirstItem?Radius.circular(10): Radius.zero, bottom: isLastItem?Radius.circular(10): Radius.zero),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFF693D92), Color(0xFFAC84D1), Color(0xFFD9CEE3)],
            ),
          ),
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            children: [
              Text(
                text.toUpperCase(),
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
              Spacer(),
              Icon(icon, color: Colors.white,)
            ],
          ),
        )
    );
  }
}

class ArrowClipper extends CustomClipper<Path>
{
  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    throw UnimplementedError();
  }
  @override
  Path getClip(Size size) {
    // TODO: implement getClip
    Path path = Path();
    path.moveTo(0, size.height);
    path.lineTo(size.width/2, 0);
    path.lineTo(size.width, size.height);
    return path;
  }
}