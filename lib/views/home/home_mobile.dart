part of home_view;



class _HomeMobile extends StatelessWidget {
  final HomeViewModel viewModel;
  final NavigatorService _navigationService = locator<NavigatorService>();

  _HomeMobile(this.viewModel);

  BoxDecoration myBoxDecoration() {
  return BoxDecoration(
    border: Border.all( color: Colors.grey[200], width: 2 ),
    borderRadius: BorderRadius.all(
        Radius.circular(5.0) //         <--- border radius here
    )
  );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text('Календарь платежей'),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(             
              child: CalendarW(),
            ),    
            Divider(),
            Expanded(
              //height: 170,
              child: ListView(
                //padding: const EdgeInsets.all(8),
                children: <Widget>[
                  Card(
                    child: ListTile(
                      leading: Icon(Icons.ac_unit),
                      title: Text('asd'),
                      onTap: () {
                        print('Sun');
                      }
                  )),
                  Card(
                    child: ListTile(
                    leading: Icon(Icons.ac_unit),
                    title: Text('asd'),
                  )),
                  Card(
                    child: ListTile(
                    leading: Icon(Icons.ac_unit),
                    title: Text('asd'),
                  )),
                  Card(
                    child: ListTile(
                    leading: Icon(Icons.ac_unit),
                    title: Text('asd'),
                  )),
                  Card(
                    child: ListTile(
                    leading: Icon(Icons.ac_unit),
                    title: Text('asd'),
                  )),
                  Card(
                    child: ListTile(
                    leading: Icon(Icons.ac_unit),
                    title: Text('asd'),
                  )),
                ],
              ),)
            
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Container(height: 50.0,),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          _navigationService.navigateTo(AddAndEditViewRoute);
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), 
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }
}
