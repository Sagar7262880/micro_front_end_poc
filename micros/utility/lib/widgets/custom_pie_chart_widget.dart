import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class CustomPieChartWidget extends StatefulWidget {
  final List<double> pieData;
  final List<String> indicators;
  final List<Color> colors;

  const CustomPieChartWidget({
    Key? key,
    required this.pieData,
    required this.indicators,
    required this.colors,
  }) : super(key: key);

  @override
  _CustomPieChartWidgetState createState() => _CustomPieChartWidgetState();
}

class _CustomPieChartWidgetState extends State<CustomPieChartWidget> {
  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildPieChart(),
        const SizedBox(height: 16),
        _buildIndicators(),
      ],
    );
  }

  Widget _buildPieChart() {
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 0.0, end: widget.pieData[0]),
      duration: const Duration(seconds: 1),
      builder: (context, animatedValue, child) {
        return AspectRatio(
          aspectRatio: 1.5,
          child: PieChart(
            PieChartData(
              pieTouchData: PieTouchData(
                touchCallback: (FlTouchEvent event, PieTouchResponse? response) {
                  setState(() {
                    if (!event.isInterestedForInteractions ||
                        response?.touchedSection == null) {
                      touchedIndex = -1;
                      return;
                    }
                    touchedIndex = response!.touchedSection!.touchedSectionIndex;
                  });
                },
              ),
              borderData: FlBorderData(show: false),
              sectionsSpace: 4,
              centerSpaceRadius: 90,
              sections: _buildChartSections(animatedValue),
            ),
          ),
        );
      },
    );
  }

  List<PieChartSectionData> _buildChartSections(double animatedValue) {
    return List.generate(widget.pieData.length, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 25.0 : 16.0;
      final radius = isTouched ? 60.0 : 30.0;
      return PieChartSectionData(
        color: widget.colors[i],
        value: i == 0 ? animatedValue : widget.pieData[i],
        title: '${(i == 0 ? animatedValue : widget.pieData[i]).toStringAsFixed(0)}%',
        radius: radius,
        titleStyle: TextStyle(
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
          color: Colors.white,
          shadows: const [
            Shadow(color: Colors.black, blurRadius: 2),
          ],
        ),
      );
    });
  }

  Widget _buildIndicators() {
    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 16,
      runSpacing: 8,
      children: List.generate(widget.indicators.length, (index) {
        return buildIndicator(
          color: widget.colors[index],
          text: widget.indicators[index],
        );
      }),
    );
  }

  Widget buildIndicator({required Color color, required String text}) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 16,
          height: 16,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 8),
        Text(text),
      ],
    );
  }
}
