import 'dart:io';
import 'package:app_starter_template/db/db_employee_helper.dart';
import 'package:app_starter_template/widgets/header.dart';
import 'package:flutter/material.dart';
import 'package:app_starter_template/models/employee.dart';
import 'dart:async';
import 'package:flutter/services.dart';

class Work extends StatefulWidget {
  @override
  _WorkState createState() => _WorkState();
}

class _WorkState extends State<Work> {

  Future<List<Employee>> employees;
  TextEditingController controller = TextEditingController();
  String name;
  int curUserId;

  final formKey = new GlobalKey<FormState>();
  var dbHelper;
  bool isUpdating;

  @override
  void initState(){
    super.initState();
    dbHelper = DBHelper();
    isUpdating = false;
    refreshList();
  }

  refreshList(){
    setState(() {
      employees = dbHelper.getEmployees();
    });
  }

  clearName(){
    controller.text = '';
  }

  SingleChildScrollView dataTable(List<Employee> employees){
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: DataTable(
        columns: [
          DataColumn(
            label: Text("Name"),
          ),
          DataColumn(
            label: Text("Delete")
          )
       ],
        rows: employees.map((employee) => DataRow(
          cells: [
            DataCell(
              Text(employee.name)
            ),
            DataCell(
              IconButton(
                icon: Icon(Icons.delete),
                onPressed: (){
                  dbHelper.delete(employee.id);
                  refreshList();
                },

              )
            )
          ]
        )).toList(),
      ),
    );
  }

  list(){
    return Expanded(
      child: FutureBuilder(
        future: employees,
        builder: (context, snapshot){
          if(snapshot.hasData){
            return dataTable(snapshot.data);
          }
          if(null == snapshot.data || snapshot.data.length == 0){
            return Text("No data found");
          }
          return CircularProgressIndicator();
        },
      ),
    );
  }

  validate(){
    if(formKey.currentState.validate()){
      formKey.currentState.save();
      if(isUpdating){
        Employee e = Employee(curUserId, name);
        dbHelper.update(e);
        setState(() {
          isUpdating = false;
        });
      }else{
        Employee e = Employee(null, name);
        dbHelper.save(e);
      }
      clearName();
      refreshList();
    }
  }

  form(){
    return Form(
      key: formKey,
      child: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          verticalDirection: VerticalDirection.down,
          children: <Widget>[
            TextFormField(
              controller: controller,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(labelText: 'Name'),
              validator: (val) => val.length == 0 ? 'Enter name' : null,
              onSaved: (val) => name = val,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                FlatButton(
                  onPressed: validate,
                  child: Text(isUpdating ? "UPDATE" : "ADD"),
                ),
                FlatButton(
                  onPressed: (){
                    setState(() {
                      isUpdating = false;
                    });
                    clearName();
                  },
                  child: Text("CANCEL"),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: new Container(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          verticalDirection: VerticalDirection.down,
          children: <Widget>[
            form(),
            list(),
          ],
        ),
      ),
    );
  }
}
