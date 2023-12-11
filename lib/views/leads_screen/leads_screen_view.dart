import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:flutter/material.dart';
import 'package:jaldi/core/models/leads.dart';
import 'package:jaldi/core/providers/leads_provider.dart';
import 'package:jaldi/widgets/dumb_widgets/login_textfield.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';
import 'leads_screen_view_model.dart';

class LeadsScreenView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LeadsScreenViewModel>.reactive(
      builder:
          (BuildContext context, LeadsScreenViewModel viewModel, Widget? _) {
        return Scaffold(
            body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/BG-lead.png'),
              fit: BoxFit.fill,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SideMenu(
                //showToggle: true,
                //displayModeToggleDuration: Duration(milliseconds: 300),
                controller: viewModel.sideMenu,
                style: SideMenuStyle(
                  toggleColor: Colors.grey,
                  displayMode: viewModel.mode,
                  hoverColor: Colors.blue[100],
                  selectedHoverColor: Colors.blue[100],
                  selectedColor: Colors.lightBlue,
                  selectedTitleTextStyle: const TextStyle(color: Colors.white),
                  selectedIconColor: Colors.white,
                  backgroundColor: Colors.white,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 50,
                      width: 50,
                      child: Image.asset(
                        'assets/images/jaldi-logo-blue.png',
                      ),
                    ),
                    const Divider(
                      indent: 8.0,
                      endIndent: 8.0,
                    ),
                  ],
                ),
                items: [
                  SideMenuItem(
                    builder: (context, displayMode) {
                      return Row(
                        children: [
                          CircleAvatar(
                            backgroundImage:
                                AssetImage('assets/images/m-logo.png'),
                          ),
                          Text('Company Inc.')
                        ],
                      );
                    },
                  ),
                  SideMenuItem(
                    builder: (context, displayMode) {
                      return const Divider(
                        endIndent: 8,
                        indent: 8,
                      );
                    },
                  ),
                  SideMenuItem(
                    builder: (context, displayMode) {
                      return ElevatedButton(
                          onPressed: () {
                            viewModel.toggleSideMenuDisplayMode();
                          },
                          child: Text('Hide'));
                    },
                  ),
                  const SideMenuItem(
                    title: 'All Leads',
                    icon: Icon(Icons.contact_mail),
                  ),
                ],
                footer: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SideMenuItem(
                    title: 'Logout',
                    icon: Icon(Icons.logout_rounded),
                  ),
                ),
              ),
              Expanded(
                child: PageView(
                  controller: viewModel.pageController,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(100.0),
                      child: Column(
                        children: [
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'CRM',
                                  style: TextStyle(fontSize: 28),
                                ),
                                Row(
                                  children: [
                                    Icon(Icons.help_rounded),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text('Need help?',
                                        style: TextStyle(fontSize: 14))
                                  ],
                                )
                              ]),
                          Container(
                            color: Colors.white,
                            child: Column(
                              children: [
                                Container(
                                  height: 96,
                                  decoration: BoxDecoration(
                                      border:
                                          Border.all(color: Color(0xFFE8E3FB)),
                                      color: Color(0xFFFBFCFF),
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(8),
                                          topLeft: Radius.circular(8))),
                                  child: Padding(
                                    padding: EdgeInsets.all(20.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('All Leads',
                                            style: TextStyle(
                                                fontSize: 28,
                                                fontWeight: FontWeight.w500)),
                                        SizedBox(
                                          height: 45,
                                          width: 163,
                                          child: TextFormField(
                                            controller:
                                                viewModel.searchController,
                                            decoration: InputDecoration(
                                              suffixIcon: Icon(Icons.search),
                                              filled: true,
                                              fillColor:
                                                  const Color(0xFFFAF8FE),
                                              border: InputBorder.none,
                                              enabledBorder:
                                                  const OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Color(
                                                              0xFFE8E3FB)),
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  8))),
                                              hintText: 'Search',
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: SingleChildScrollView(
                                    child: Container(
                                      height: 600,
                                      child: FutureBuilder<Leads?>(
                                          future: Provider.of<LeadsProvider>(
                                                  context,
                                                  listen: false)
                                              .fetchLeads(isMock: true),
                                          builder: (context, snapshot) {
                                            if (snapshot.connectionState ==
                                                ConnectionState.waiting) {
                                              return const CircularProgressIndicator();
                                            } else {
                                              List<DataRow> dataRow = [];
                                              for (var element
                                                  in snapshot.data!.leads!) {
                                                DataCell checkbox = DataCell(
                                                    Checkbox(
                                                        value: false,
                                                        onChanged: (value) {}));
                                                DataCell firstName = DataCell(
                                                    Text(element.firstName
                                                        .toString()));
                                                DataCell lastname = DataCell(
                                                    Text(element.lastName
                                                        .toString()));

                                                DataCell email = DataCell(Text(
                                                    element.email.toString()));

                                                DataCell phone = DataCell(Text(
                                                    element.phone.toString()));

                                                DataCell source = DataCell(Text(
                                                    element.source.toString()));

                                                DataCell camp = DataCell(Text(
                                                    element.campaignName
                                                        .toString()));

                                                DataCell agentName =
                                                    DataCell(Row(
                                                  children: [
                                                    CircleAvatar(
                                                      backgroundImage: AssetImage(
                                                          'assets/images/jaldi-logo-yellow.png'),
                                                    ),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    Text(element.agentName
                                                        .toString())
                                                  ],
                                                ));

                                                DataCell dateUpdated = DataCell(
                                                    Text(element.dateUpdated
                                                        .toString()));

                                                dataRow.add(DataRow(cells: [
                                                  checkbox,
                                                  firstName,
                                                  lastname,
                                                  email,
                                                  phone,
                                                  source,
                                                  camp,
                                                  agentName,
                                                  dateUpdated
                                                ]));
                                              }

                                              return DataTable(
                                                  border: TableBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20)),
                                                  columns: [
                                                    DataColumn(
                                                      label: Checkbox(
                                                          value: false,
                                                          onChanged:
                                                              (value) {}),
                                                    ),
                                                    DataColumn(
                                                      label: Row(
                                                        children: [
                                                          Text("First Name"),
                                                          IconButton(
                                                              onPressed: () {},
                                                              icon: Icon(Icons
                                                                  .arrow_drop_down_sharp))
                                                        ],
                                                      ),
                                                    ),
                                                    DataColumn(
                                                      label: Row(
                                                        children: [
                                                          Text("Last Name"),
                                                          IconButton(
                                                              onPressed: () {},
                                                              icon: Icon(Icons
                                                                  .arrow_drop_down_sharp))
                                                        ],
                                                      ),
                                                    ),
                                                    DataColumn(
                                                      label: Row(
                                                        children: [
                                                          Text("Phone Number"),
                                                          IconButton(
                                                              onPressed: () {},
                                                              icon: Icon(Icons
                                                                  .arrow_drop_down_sharp))
                                                        ],
                                                      ),
                                                    ),
                                                    DataColumn(
                                                      label: Row(
                                                        children: [
                                                          Text("Email"),
                                                          IconButton(
                                                              onPressed: () {},
                                                              icon: Icon(Icons
                                                                  .arrow_drop_down_sharp))
                                                        ],
                                                      ),
                                                    ),
                                                    DataColumn(
                                                      label: Row(
                                                        children: [
                                                          Text("Source"),
                                                          IconButton(
                                                              onPressed: () {},
                                                              icon: Icon(Icons
                                                                  .arrow_drop_down_sharp))
                                                        ],
                                                      ),
                                                    ),
                                                    DataColumn(
                                                      label: Row(
                                                        children: [
                                                          Text("Campaign"),
                                                          IconButton(
                                                              onPressed: () {},
                                                              icon: Icon(Icons
                                                                  .arrow_drop_down_sharp))
                                                        ],
                                                      ),
                                                    ),
                                                    DataColumn(
                                                      label: Row(
                                                        children: [
                                                          Text("Lead Owner"),
                                                          IconButton(
                                                              onPressed: () {},
                                                              icon: Icon(Icons
                                                                  .arrow_drop_down_sharp))
                                                        ],
                                                      ),
                                                    ),
                                                    DataColumn(
                                                      label: Row(
                                                        children: [
                                                          Text("Last updated"),
                                                          IconButton(
                                                              onPressed: () {},
                                                              icon: Icon(Icons
                                                                  .arrow_drop_down_sharp))
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                  rows: dataRow);
                                            }
                                          }),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
      },
      viewModelBuilder: () => LeadsScreenViewModel(),
    );
  }
}
