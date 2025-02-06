import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:testapp/statemanager/provider1.dart';
import 'package:testapp/utils/textwidgets.dart';
// import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class RevenueChart extends StatelessWidget {
  const RevenueChart({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Provider1>(context);
    final theme = Theme.of(context).colorScheme;
    return Container(
      // height: 350,
      width: 340.w,
      padding: EdgeInsets.all(10.sp),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          theme.primary.withOpacity(0.6),
          theme.primary.withOpacity(0.3),
          theme.primary.withOpacity(0.6),
        ]),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: theme.shadow.withOpacity(0.15),
            blurRadius: 4,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Sectionheading(subtitle: 'Revenue'),
              Container(
                  width: 120.w,
                  height: 30.h,
                  padding: EdgeInsets.all(5.sp),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      theme.primary.withOpacity(0.6),
                      theme.primary.withOpacity(0.3),
                      theme.primary.withOpacity(0.6),
                    ]),
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                  child: DropdownMonths()),
            ],
          ),
          SizedBox(
            height: 5.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '\$4500',
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    fontSize: 22,
                    height: 1.2,
                    fontWeight: FontWeight.w600,
                    color: theme.secondaryContainer,
                  ),
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      provider.changechart('bar');
                    },
                    child: Container(
                      height: 24.h,
                      width: 24.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          gradient: provider.selected == 'bar'
                              ? LinearGradient(colors: [
                                  theme.primary
                                      .withOpacity(0.6),
                                  theme.primary
                                      .withOpacity(0.3),
                                  theme.primary
                                      .withOpacity(0.6),
                                ])
                              : LinearGradient(colors: [
                                  Colors.transparent,
                                  Colors.transparent
                                ])),
                      child: Center(
                        child: Icon(
                          Icons.bar_chart,
                          color: provider.selected == 'bar'
                              ? theme.secondaryContainer
                              : theme.primary,
                          size: 20.sp,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  GestureDetector(
                    onTap: () {
                      provider.changechart('line');
                    },
                    child: Container(
                      height: 24.h,
                      width: 24.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          gradient: provider.selected == 'line'
                              ? LinearGradient(colors: [
                                  theme.primary
                                      .withOpacity(0.6),
                                  theme.primary
                                      .withOpacity(0.3),
                                  theme.primary
                                      .withOpacity(0.6),
                                ])
                              : LinearGradient(colors: [
                                  Colors.transparent,
                                  Colors.transparent
                                ])),
                      child: Center(
                        child: Icon(
                          Icons.show_chart_sharp,
                          color: provider.selected == 'line'
                              ? theme.secondaryContainer
                              : theme.primary,
                          size: 20.sp,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 250.h,
            child: provider.selected == "line"
                ? LineChartScreen()
                : GroupedHistogramChart(),
          )
        ],
      ),
    );
  }
}

/////////////////////////////////////////////
// ignore: must_be_immutable

class DropdownMonths extends StatelessWidget {
  DropdownMonths({super.key});

  final List<String> _months = [
    'January', 'February', 'March', 'April', 'May', 'June',
    'July', 'August', 'September', 'October', 'November', 'December'
  ];

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Provider1>(context);
    final theme = Theme.of(context).colorScheme;

    return DropdownButtonHideUnderline(
      child: DropdownButton2<String>(
        value: provider.selectedMonth, // Get value from provider
        isExpanded: true, // Ensures the button takes full width
        iconStyleData: IconStyleData(
          icon: const Icon(Icons.keyboard_arrow_down_rounded),
          iconSize: 20.sp,
          iconEnabledColor: theme.shadow,
        ),
        dropdownStyleData: DropdownStyleData(
          padding: EdgeInsets.symmetric(vertical: 5.sp,horizontal: 0),
          maxHeight: 200.h, // Set max height for dropdown
          elevation: 5,
          width: 120.w,
          offset: const Offset(-5, -5), // Ensures dropdown opens below
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            color: theme.primary.withOpacity(0.8),
          ),
        ),
        menuItemStyleData: MenuItemStyleData(
          padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 4.h),
        ),
        style: TextStyle(color: theme.shadow, fontSize: 18.sp),
        onChanged: (String? newValue) {
          provider.updateMonth(newValue!); 
        },
        items: _months.map<DropdownMenuItem<String>>((String month) {
          return DropdownMenuItem<String>(
            value: month,
            child: Text(
              month,
              style: TextStyle(fontSize: 12.sp, height: 1.2),
            ),
          );
        }).toList(),
      ),
    );
  }
}
//////////////////////////////////



class LineChartScreen extends StatefulWidget {
  const LineChartScreen({super.key});

  @override
  _LineChartScreenState createState() => _LineChartScreenState();
}

class _LineChartScreenState extends State<LineChartScreen> {
  late List<ChartData> _chartData;

  @override
  void initState() {
    super.initState();
    _chartData = getChartData();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return SfCartesianChart(
      // title: ChartTitle(text: 'Sales Comparison'),

      legend: Legend(
        isVisible: true, // Enables legends
        // overflowMode: LegendItemOverflowMode.wrap,
        iconHeight: 10.h, // Small circle size
        iconWidth: 10.w,
        legendItemBuilder:
            (String name, dynamic series, dynamic point, int index) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.sp),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 10.w, // Small circle size
                  height: 10.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: series.color, // Use series color for circle
                  ),
                ),
                SizedBox(width: 5.w), // Space between circle and text
                Text(
                  name, // Keep the legend name
                  style: TextStyle(fontSize: 12.sp, color: theme.shadow),
                ),
              ],
            ),
          );
        },
        position: LegendPosition.bottom, // Places legends at bottom
      ),

      plotAreaBorderWidth: 0, // Removes the border around the chart
      plotAreaBackgroundColor: Colors.transparent, // Transparent background
      margin: EdgeInsets.zero, // Removes extra margins around the chart
      primaryXAxis: CategoryAxis(
        majorGridLines:  MajorGridLines(
          width: 1, // Keep vertical grid lines
          dashArray: <double>[5, 3], // Makes vertical lines dashed
          color: theme.onTertiary, // Optional: Set color of dashes
        ),
        // interval: 5, // This controls the range of values to plot grid lines
        //     minimum: 0, // Set the minimum value for the Y-axis
        //     maximum: 50, // Set the maximum value for the Y-axis
        minorGridLines: const MinorGridLines(width: 0), // No minor grid lines
        axisLine: const AxisLine(width: 0), // Remove axis line
      ),
      primaryYAxis: NumericAxis(
        majorGridLines:
            const MajorGridLines(width: 0), // Removes horizontal grid lines
        minorGridLines: const MinorGridLines(width: 0),
        axisLine: const AxisLine(width: 0), // Remove Y-axis line
      ),

      // primaryXAxis: CategoryAxis(), // X-Axis (Categories)
      // primaryYAxis: NumericAxis(
      //   majorGridLines:
      //       const MajorGridLines(width: 0), // Removes horizontal grid lines
      //   minorGridLines: const MinorGridLines(width: 0),
      // ), // Y-Axis (Numeric Values)
      // plotAreaBorderWidth: 0, // Removes the border around the chart
      // plotAreaBackgroundColor: Colors.transparent,
      series: <LineSeries<ChartData, String>>[
        LineSeries<ChartData, String>(
          name: 'Bed Room', // Legend Name
          dataSource: _chartData,
          xValueMapper: (ChartData data, _) => data.month,
          yValueMapper: (ChartData data, _) => data.salesA,
          markerSettings: MarkerSettings(
              isVisible: true,
              borderWidth: 0,
              color: theme.secondaryContainer,
              height: 5.h,
              width: 5.w), // Show data points
          color: theme.secondaryContainer, // Line color
        ),
        LineSeries<ChartData, String>(
            name: 'Living Room', // Legend Name
            dataSource: _chartData,
            xValueMapper: (ChartData data, _) => data.month,
            yValueMapper: (ChartData data, _) => data.salesB,
            markerSettings: MarkerSettings(
                isVisible: true,
                borderWidth: 0,
                color: theme.tertiaryContainer,
                height: 5.h,
                width: 5.w),
            color: theme.tertiaryContainer // Line color
            ),
      ],
    );
  }

  // Sample Data
  List<ChartData> getChartData() {
    return [
      ChartData('Jan', 30, 40),
      ChartData('Feb', 42, 50),
      ChartData('Mar', 54, 60),
      ChartData('Apr', 70, 80),
      ChartData('May', 80, 90),
      ChartData('Jun', 90, 100),
    ];
  }
}

// Data Model
class ChartData {
  ChartData(this.month, this.salesA, this.salesB);
  final String month;
  final double salesA;
  final double salesB;
}

class GroupedHistogramChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return SfCartesianChart(
      plotAreaBorderWidth: 0, // Removes the border around the chart
      plotAreaBackgroundColor: Colors.transparent, // Transparent background
      margin: EdgeInsets.zero, // Removes extra margins around the chart
      primaryXAxis: CategoryAxis(
        majorGridLines: MajorGridLines(
          width: 1.w, // Keep vertical grid lines
          dashArray: <double>[5, 3], // Makes vertical lines dashed
          color: theme.onTertiary, // Optional: Set color of dashes
        ),
        // interval: 10, // This controls the range of values to plot grid lines
        // minimum: 0, // Set the minimum value for the Y-axis
        // maximum: 10, // Set the maximum value for the Y-axis
        minorGridLines: const MinorGridLines(width: 0), // No minor grid lines
        axisLine: const AxisLine(width: 0), // Remove axis line
      ),
      primaryYAxis: NumericAxis(
        majorGridLines:
            const MajorGridLines(width: 0), // Removes horizontal grid lines
        minorGridLines: const MinorGridLines(width: 0),
        axisLine: const AxisLine(width: 0), // Remove Y-axis line
      ),
      // title: ChartTitle(text: 'Grouped Histogram Example'),
      // legend: Legend(isVisible: true, position: LegendPosition.bottom),

      legend: Legend(
        isVisible: true, // Enables legends
        // overflowMode: LegendItemOverflowMode.wrap,
        iconHeight: 10.h, // Small circle size
        iconWidth: 10.w,
        legendItemBuilder:
            (String name, dynamic series, dynamic point, int index) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.sp),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 10.w, // Small circle size
                  height: 10.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: series.color, // Use series color for circle
                  ),
                ),
                SizedBox(width: 5.w), // Space between circle and text
                Text(
                  name, // Keep the legend name
                  style: TextStyle(fontSize: 12.sp, color: theme.shadow),
                ),
              ],
            ),
          );
        },
        position: LegendPosition.bottom, // Places legends at bottom
      ),

      series: <ChartSeries>[
        // First group of data
        ColumnSeries<SalesData, String>(
          name: 'Bed Room',
          dataSource: <SalesData>[
            SalesData('Jan', 35),
            SalesData('Feb', 28),
            SalesData('Mar', 34),
            SalesData('Apr', 32),
          ],
          xValueMapper: (SalesData data, _) => data.month,
          yValueMapper: (SalesData data, _) => data.sales,
          width: 0.8.sp, // Control bar width for proper grouping
          color: theme.secondaryContainer,
          borderRadius: BorderRadius.vertical(top: Radius.circular(4).r),
        ),
        // Second group of data
        ColumnSeries<SalesData, String>(
          name: 'Living Room',
          dataSource: <SalesData>[
            SalesData('Jan', 45),
            SalesData('Feb', 38),
            SalesData('Mar', 48),
            SalesData('Apr', 42),
          ],
          xValueMapper: (SalesData data, _) => data.month,
          yValueMapper: (SalesData data, _) => data.sales,
          width: 0.8.w, // Control bar width for proper grouping
          color: theme.tertiaryContainer,
          borderRadius: BorderRadius.vertical(top: Radius.circular(4)),
        ),
      ],
    );
  }
}

class SalesData {
  SalesData(this.month, this.sales);

  final String month;
  final double sales;
}
