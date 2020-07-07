import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fl_chart/fl_chart.dart';

//void main() => runApp(TestScreen());

class ChartPage extends StatefulWidget {
  const ChartPage({Key key}) : super(key: key);

  @override
  createState() => _ChartPageState();
}

class _ChartPageState extends State<ChartPage>
    with SingleTickerProviderStateMixin {
  TabController controller;
  List<Tab> tabBars;
  List<Widget> tabBarViews;
  final tabIconSize = 30.0;

  @override
  void initState() {
    controller = new TabController(vsync: this, length: 2);
    controller.index = 1;
    tabBars = [
      Tab(icon: Icon(FontAwesomeIcons.solidHandRock, size: tabIconSize)),
      Tab(icon: Icon(FontAwesomeIcons.stopwatch, size: tabIconSize)),
    ];
    tabBarViews = [ChartPage1(), ChartPage2()];

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return MaterialApp(
      title: 'Chart Page',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: Scaffold(
        bottomNavigationBar: Material(
          child: SafeArea(child: TabBar(controller: controller, tabs: tabBars)),
          color: theme.primaryColor,
        ),
        body: TabBarView(
          children: tabBarViews,
          controller: controller,
          physics: NeverScrollableScrollPhysics(),
        ),
      ),
    );
  }
}

class ChartPage1 extends StatefulWidget {
  @override
  createState() => _ChartPage1State();
}

class _ChartPage1State extends State<ChartPage1> {
  final Color dark = const Color(0xff3b8c75);
  final Color normal = const Color(0xff64caad);
  final Color light = const Color(0xff73e8c9);

  @override
  void initState() {
    super.initState();
    print('initState ChartPage1');
  }

  @override
  void dispose() {
    print('dispose ChartPage1');

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text('拍痰力道'),
        ),
        body: Center(
          child: AspectRatio(
            aspectRatio: 0.7,
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6)),
              color: Color(0xff2c4260),
              child: Padding(
                padding: const EdgeInsets.only(top: 3.5),
                child: BarChart(
                  BarChartData(
                    alignment: BarChartAlignment.center,
                    barTouchData: BarTouchData(
                      enabled: false,
                    ),
                    titlesData: FlTitlesData(
                      show: true,
                      bottomTitles: SideTitles(
                        showTitles: true,
                        textStyle:
                            const TextStyle(color: Colors.white, fontSize: 15),
                        margin: 10,
                        getTitles: (double value) {
                          switch (value.toInt()) {
                            case 0:
                              return '6/3';
                            case 1:
                              return '6/4';
                            case 2:
                              return '6/5';
                            case 3:
                              return '6/6';
                            default:
                              return '';
                          }
                        },
                      ),
                      leftTitles: SideTitles(
                        showTitles: true,
                        textStyle:
                            const TextStyle(color: Colors.white, fontSize: 10),
                        margin: 7,
                      ),
                    ),
                    gridData: FlGridData(
                      show: true,
                      checkToShowHorizontalLine: (value) => value % 10 == 0,
                      getDrawingHorizontalLine: (value) => FlLine(
                        color: const Color(0xffe7e8ec),
                        strokeWidth: 1,
                      ),
                    ),
                    borderData: FlBorderData(
                      show: false,
                    ),
                    groupsSpace: 20,
                    barGroups: getData(),
                  ),
                ),
              ),
            ),
          ),
        ));
  }

  List<BarChartGroupData> getData() {
    return [
      BarChartGroupData(
        x: 0,
        barsSpace: 4,
        barRods: [
          BarChartRodData(
              y: 90,
              rodStackItem: [
                BarChartRodStackItem(0, 40, dark),
                BarChartRodStackItem(40, 60, normal),
                BarChartRodStackItem(60, 90, light),
              ],
              width: 30,
              borderRadius: const BorderRadius.all(Radius.zero)),
        ],
      ),
      BarChartGroupData(
        x: 1,
        barsSpace: 4,
        barRods: [
          BarChartRodData(
              y: 40,
              rodStackItem: [
                BarChartRodStackItem(0, 10, dark),
                BarChartRodStackItem(10, 20, normal),
                BarChartRodStackItem(20, 40, light),
              ],
              width: 30,
              borderRadius: const BorderRadius.all(Radius.zero)),
        ],
      ),
      BarChartGroupData(
        x: 2,
        barsSpace: 4,
        barRods: [
          BarChartRodData(
              y: 100,
              rodStackItem: [
                BarChartRodStackItem(0, 30, dark),
                BarChartRodStackItem(30, 50, normal),
                BarChartRodStackItem(50, 100, light),
              ],
              width: 30,
              borderRadius: const BorderRadius.all(Radius.zero)),
        ],
      ),
      BarChartGroupData(
        x: 3,
        barsSpace: 4,
        barRods: [
          BarChartRodData(
              y: 90,
              rodStackItem: [
                BarChartRodStackItem(0, 30, dark),
                BarChartRodStackItem(30, 80, normal),
                BarChartRodStackItem(80, 90, light),
              ],
              width: 30,
              borderRadius: const BorderRadius.all(Radius.zero)),
        ],
      ),
    ];
  }
}

class ChartPage2 extends StatefulWidget {
  @override
  createState() => _ChartPage2State();
}

class _ChartPage2State extends State<ChartPage2> {
  @override
  void initState() {
    super.initState();
    print('initState ChartPage2');
  }

  @override
  void dispose() {
    print('dispose ChartPage2');

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text('拍痰次數'),
        ),
        body: Center(
          child: AspectRatio(
            aspectRatio: 0.7,
            child: Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4)),
              color: const Color(0xff2c4260),
              child: BarChart(
                BarChartData(
                  alignment: BarChartAlignment.spaceAround,
                  maxY: 8,
                  barTouchData: BarTouchData(
                    enabled: false,
                    touchTooltipData: BarTouchTooltipData(
                      tooltipBgColor: Colors.transparent,
                      tooltipPadding: const EdgeInsets.all(0),
                      tooltipBottomMargin: 8,
                      getTooltipItem: (
                        BarChartGroupData group,
                        int groupIndex,
                        BarChartRodData rod,
                        int rodIndex,
                      ) {
                        return BarTooltipItem(
                          rod.y.round().toString(),
                          TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        );
                      },
                    ),
                  ),
                  titlesData: FlTitlesData(
                    show: true,
                    bottomTitles: SideTitles(
                      showTitles: true,
                      textStyle: TextStyle(
                          color: const Color(0xff7589a2),
                          fontWeight: FontWeight.bold,
                          fontSize: 14),
                      margin: 15,
                      getTitles: (double value) {
                        switch (value.toInt()) {
                          case 0:
                            return '星期一';
                          case 1:
                            return '星期二';
                          case 2:
                            return '星期三';
                          case 3:
                            return '星期四';
                          case 4:
                            return '星期五';
                          case 5:
                            return '星期六';
                          case 6:
                            return '星期日';
                          default:
                            return '';
                        }
                      },
                    ),
                    leftTitles: SideTitles(
                      showTitles: true,
                      textStyle:
                          const TextStyle(color: Colors.white, fontSize: 15),
                      margin: 4,
                    ),
                  ),
                  borderData: FlBorderData(
                    show: false,
                  ),
                  barGroups: [
                    BarChartGroupData(x: 0, barRods: [
                      BarChartRodData(
                          y: 2, color: Colors.lightBlueAccent, width: 30)
                    ], showingTooltipIndicators: [
                      0
                    ]),
                    BarChartGroupData(x: 1, barRods: [
                      BarChartRodData(
                          y: 3, color: Colors.lightBlueAccent, width: 30)
                    ], showingTooltipIndicators: [
                      0
                    ]),
                    BarChartGroupData(x: 2, barRods: [
                      BarChartRodData(
                          y: 1, color: Colors.lightBlueAccent, width: 30)
                    ], showingTooltipIndicators: [
                      0
                    ]),
                    BarChartGroupData(x: 3, barRods: [
                      BarChartRodData(
                          y: 5, color: Colors.lightBlueAccent, width: 30)
                    ], showingTooltipIndicators: [
                      0
                    ]),
                    BarChartGroupData(x: 4, barRods: [
                      BarChartRodData(
                          y: 3, color: Colors.lightBlueAccent, width: 30)
                    ], showingTooltipIndicators: [
                      0
                    ]),
                    BarChartGroupData(x: 5, barRods: [
                      BarChartRodData(
                          y: 2, color: Colors.lightBlueAccent, width: 30)
                    ], showingTooltipIndicators: [
                      0
                    ]),
                    BarChartGroupData(x: 6, barRods: [
                      BarChartRodData(
                          y: 6, color: Colors.lightBlueAccent, width: 30)
                    ], showingTooltipIndicators: [
                      0
                    ]),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
