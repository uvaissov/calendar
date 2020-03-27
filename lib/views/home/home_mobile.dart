part of home_view;

final items = List<String>.generate(10, (i) => "Item ${i+1}");

class _HomeMobile extends StatelessWidget {
  final HomeViewModel viewModel;
  final NavigatorService _navigationService = locator<NavigatorService>();

  _HomeMobile(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            CardContainer(
                child: CalendarW(),
            ),
            Card(
                child: ListTile(
                    leading: Text('17', style: TextStyle(fontSize: 37),),
                    title: Text('Title ' ),
                    subtitle: Text('afddd'),
                    onTap: () {
                      print('Sun');
                    }))
          ],          
            
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Container(
          height: 50.0,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _navigationService.navigateTo(AddAndEditViewRoute);
        },
        tooltip: 'Increment',
        backgroundColor: blueColor,
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }

  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     //appBar: AppBar(centerTitle: true, title: Text('Календарь платежей'),),
  //     body: SafeArea(
  //       child: Container(
  //         padding: EdgeInsets.symmetric( horizontal: 8 ),
  //         child: Column(
  //           mainAxisAlignment: MainAxisAlignment.start,
  //           children: <Widget>[
  //             Container(
  //               child: CalendarW(),
  //             ),
  //             Divider(),
  //             Expanded(
  //               //height: 170,
  //               child: ListView(
  //                 //padding: const EdgeInsets.all(8),
  //                 children: <Widget>[
  //                   Card(
  //                       child: ListTile(
  //                           leading: Icon(Icons.ac_unit),
  //                           title: Text('asd'),
  //                           onTap: () {
  //                             print('Sun');
  //                           })),
  //                   Card(
  //                       child: ListTile(
  //                     leading: Icon(Icons.ac_unit),
  //                     title: Text('asd'),
  //                   )),
  //                   Card(
  //                       child: ListTile(
  //                     leading: Icon(Icons.ac_unit),
  //                     title: Text('asd'),
  //                   )),
  //                   Card(
  //                       child: ListTile(
  //                     leading: Icon(Icons.ac_unit),
  //                     title: Text('asd'),
  //                   )),
  //                   Card(
  //                       child: ListTile(
  //                     leading: Icon(Icons.ac_unit),
  //                     title: Text('asd'),
  //                   )),
  //                   Card(
  //                       child: ListTile(
  //                     leading: Icon(Icons.ac_unit),
  //                     title: Text('asd'),
  //                   )),
  //                 ],
  //               ),
  //             )
  //           ],
  //         ),
  //       ),
  //     ),
  //     bottomNavigationBar: BottomAppBar(
  //       shape: const CircularNotchedRectangle(),
  //       child: Container(
  //         height: 50.0,
  //       ),
  //     ),
  //     floatingActionButton: FloatingActionButton(
  //       onPressed: () {
  //         _navigationService.navigateTo(AddAndEditViewRoute);
  //       },
  //       tooltip: 'Increment',
  //       child: Icon(Icons.add),
  //     ),
  //     floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
  //   );
  // }
}
