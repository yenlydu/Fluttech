import 'package:flutter/material.dart';
import 'package:date_range_picker/date_range_picker.dart' as DateRangePicker;
import 'package:flutter2/Web/Navigation/HandleProjects/ProjectInformation.dart';

Widget pickRangeDate({BuildContext context, DateTime beginDate, DateTime endDate, function})
{
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      RaisedButton(
          onPressed: () async {
            final List<DateTime> picked = await DateRangePicker.showDatePicker(
                context: context,
                initialFirstDate: beginDate,
                initialLastDate: endDate,
                firstDate: new DateTime(2010),
                lastDate: new DateTime(2030)
            );
            if (picked != null && picked.length == 2) {
              function(picked);
            }
          },
          child: Row(
            children: [
              Icon(Icons.access_time),
              Text(" Pick begin/end of the project"),
            ],
          )
      ),

    ],
  );
}