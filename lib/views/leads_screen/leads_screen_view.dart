import 'package:flutter/material.dart';
import 'package:jaldi/core/constants/app_assets.dart';
import 'package:jaldi/core/helpers/custom_data_source.dart';
import 'package:jaldi/core/models/leads.dart';
import 'package:jaldi/core/providers/leads_provider.dart';
import 'package:jaldi/widgets/dumb_widgets/login_textfield.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';
import 'package:vrouter/vrouter.dart';
import '../../core/providers/authentication_provider.dart';
import 'leads_screen_view_model.dart';
import 'package:flutter_side_menu/flutter_side_menu.dart';

class LeadsScreenView extends StatelessWidget {
  const LeadsScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LeadsScreenViewModel>.reactive(
      builder:
          (BuildContext context, LeadsScreenViewModel viewModel, Widget? _) {
        return Scaffold(
            body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AppAssets.leadsBG),
              fit: BoxFit.fill,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SideMenu(
                mode: viewModel.mode,
                hasResizerToggle: false,
                controller: viewModel.sideMenuController,
                minWidth: 110,
                hasResizer: false,
                builder: (data) => SideMenuData(
                  footer: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      TextButton.icon(
                          onPressed: () {
                            Provider.of<AuthenticationProvider>(context,
                                    listen: false)
                                .logout();
                            context.vRouter.to("/login");
                          },
                          icon: const Icon(Icons.logout),
                          label: viewModel.mode == SideMenuMode.open
                              ? const Text("Logout")
                              : Container()),
                    ],
                  ),
                  header: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: Image.asset(
                          AppAssets.jaldiBlueLogo,
                          scale: 5,
                        ),
                      ),
                      const Divider()
                    ],
                  ),
                  items: [
                    SideMenuItemDataTile(
                      isSelected: false,
                      onTap: () {},
                      title: 'Company Inc.',
                      icon: Image.asset(AppAssets.mLogo),
                    ),
                    const SideMenuItemDataDivider(divider: Divider()),
                    SideMenuItemDataTile(
                        margin: EdgeInsetsDirectional.symmetric(
                            horizontal: viewModel.hideButtonWidth),
                        itemHeight: 24,
                        isSelected: false,
                        onTap: () {
                          viewModel.toggleMenu();
                        },
                        icon: Container(
                          decoration: BoxDecoration(
                              color: const Color(0xffE4DFDA),
                              borderRadius: BorderRadius.circular(4)),
                          child: Row(
                            mainAxisAlignment: viewModel.rowAllignment,
                            children: [
                              const Center(
                                  child: Icon(
                                Icons.arrow_back_ios,
                                size: 15,
                              )),
                              viewModel.mode == SideMenuMode.open
                                  ? const Text("Hide")
                                  : Container()
                            ],
                          ),
                        )),
                    SideMenuItemDataTile(
                      isSelected: true,
                      onTap: () {},
                      title: 'All Leads',
                      icon: Image.asset(AppAssets.allLeadsButton),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: PageView(
                  controller: viewModel.pageController,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          const Row(
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
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8))),
                            child: Column(
                              children: [
                                Container(
                                  height: 96,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: const Color(0xFFE8E3FB)),
                                      color: const Color(0xFFFBFCFF),
                                      borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(8),
                                          topRight: Radius.circular(8))),
                                  child: Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text('All Leads',
                                            style: TextStyle(
                                                fontSize: 28,
                                                fontWeight: FontWeight.w500)),
                                        SizedBox(
                                          height: 45,
                                          width: 163,
                                          child: LoginTextField(
                                            controller:
                                                viewModel.searchController,
                                            obscureText: false,
                                            hintText: 'Search',
                                            suffixIcon: IconButton(
                                              icon: const Icon(Icons.search),
                                              onPressed: () {},
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Consumer<LeadsProvider?>(
                                    builder: (context, value, child) {
                                  if (value!.isLoading) {
                                    return const CircularProgressIndicator();
                                  } else {
                                    List<DataRow> dataRows = [];

                                    for (int x = 0;
                                        x < value.leads!.leads!.length;
                                        x++) {
                                      InnerLeadData element =
                                          value.leads!.leads![x];
                                      DataCell checkbox = DataCell(Checkbox(
                                          value: false, onChanged: (value) {}));
                                      DataCell firstName = DataCell(
                                          Text(element.firstName.toString()));
                                      DataCell lastname = DataCell(
                                          Text(element.lastName.toString()));
                                      DataCell phone = DataCell(
                                          Text(element.phone.toString()));

                                      DataCell email = DataCell(
                                          Text(element.email.toString()));

                                      DataCell source = DataCell(
                                          Text(element.source.toString()));

                                      DataCell camp = DataCell(Text(
                                          element.campaignName.toString()));

                                      DataCell agentName = DataCell(Row(
                                        children: [
                                          const CircleAvatar(
                                            backgroundImage: AssetImage(
                                                AppAssets.jaldiYellowLogo),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Text(element.agentName.toString())
                                        ],
                                      ));

                                      DataCell dateUpdated = DataCell(
                                          Text(element.dateUpdated.toString()));

                                      dataRows.add(DataRow(cells: [
                                        checkbox,
                                        firstName,
                                        lastname,
                                        phone,
                                        email,
                                        source,
                                        camp,
                                        agentName,
                                        dateUpdated
                                      ]));
                                    }

                                    final CustomDataSource dataSource =
                                        CustomDataSource(dataRows);

                                    return Theme(
                                      data: Theme.of(context).copyWith(
                                        cardTheme: const CardTheme(
                                            margin: EdgeInsets.all(
                                                0), // reset margin
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(8),
                                                  bottomRight: Radius.circular(
                                                      8)), // Change radius
                                            ),
                                            color: Colors.white),
                                      ),
                                      child: PaginatedDataTable(
                                        columns: [
                                          DataColumn(
                                            label: Checkbox(
                                                value: false,
                                                onChanged: (value) {}),
                                          ),
                                          DataColumn(
                                            label: Row(
                                              children: [
                                                const Text("First Name"),
                                                IconButton(
                                                    onPressed: () {},
                                                    icon: const Icon(Icons
                                                        .arrow_drop_down_sharp))
                                              ],
                                            ),
                                            onSort: (columnIndex, ascending) {
                                              value.toggleSort('firstName');
                                            },
                                          ),
                                          DataColumn(
                                            label: Row(
                                              children: [
                                                const Text("Last Name"),
                                                IconButton(
                                                    onPressed: () {},
                                                    icon: const Icon(Icons
                                                        .arrow_drop_down_sharp))
                                              ],
                                            ),
                                            onSort: (columnIndex, ascending) {
                                              value.toggleSort('lastName');
                                            },
                                          ),
                                          DataColumn(
                                            label: Row(
                                              children: [
                                                const Text("Phone Number"),
                                                IconButton(
                                                    onPressed: () {},
                                                    icon: const Icon(Icons
                                                        .arrow_drop_down_sharp))
                                              ],
                                            ),
                                            onSort: (columnIndex, ascending) {
                                              value.toggleSort('phone');
                                            },
                                          ),
                                          DataColumn(
                                            label: Row(
                                              children: [
                                                const Text("Email"),
                                                IconButton(
                                                    onPressed: () {},
                                                    icon: const Icon(Icons
                                                        .arrow_drop_down_sharp))
                                              ],
                                            ),
                                            onSort: (columnIndex, ascending) {
                                              value.toggleSort('email');
                                            },
                                          ),
                                          DataColumn(
                                            label: Row(
                                              children: [
                                                const Text("Source"),
                                                IconButton(
                                                    onPressed: () {},
                                                    icon: const Icon(Icons
                                                        .arrow_drop_down_sharp))
                                              ],
                                            ),
                                            onSort: (columnIndex, ascending) {
                                              value.toggleSort('source');
                                            },
                                          ),
                                          DataColumn(
                                            label: Row(
                                              children: [
                                                const Text("Campaign"),
                                                IconButton(
                                                    onPressed: () {},
                                                    icon: const Icon(Icons
                                                        .arrow_drop_down_sharp))
                                              ],
                                            ),
                                            onSort: (columnIndex, ascending) {
                                              value.toggleSort('campaign');
                                            },
                                          ),
                                          DataColumn(
                                            label: Row(
                                              children: [
                                                const Text("Lead Owner"),
                                                IconButton(
                                                    onPressed: () {},
                                                    icon: const Icon(Icons
                                                        .arrow_drop_down_sharp))
                                              ],
                                            ),
                                            onSort: (columnIndex, ascending) {
                                              value.toggleSort('agentName');
                                            },
                                          ),
                                          DataColumn(
                                            label: Row(
                                              children: [
                                                const Text("Last updated"),
                                                IconButton(
                                                    onPressed: () {},
                                                    icon: const Icon(Icons
                                                        .arrow_drop_down_sharp))
                                              ],
                                            ),
                                            onSort: (columnIndex, ascending) {
                                              value.toggleSort('lastUpdated');
                                            },
                                          ),
                                        ],
                                        source: dataSource,
                                        rowsPerPage:
                                            10, // Number of rows per page
                                      ),
                                    );
                                  }
                                }),
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
      viewModelBuilder: () => LeadsScreenViewModel(context),
    );
  }
}
