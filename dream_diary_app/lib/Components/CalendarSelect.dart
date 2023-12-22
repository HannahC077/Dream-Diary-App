import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

enum FilterType {
  day,
  month,
  year,
}

class SingleChoice extends StatefulWidget {
  final ValueChanged<FilterType> onFilterSelected;
  final FilterType initialFilter;

  const SingleChoice({
    Key? key,
    required this.onFilterSelected,
    required this.initialFilter,
  }) : super(key: key);

  @override
  State<SingleChoice> createState() => _SingleChoiceState();
}

class _SingleChoiceState extends State<SingleChoice> {
  late FilterType filterType;

  @override
  void initState() {
    super.initState();
    filterType = widget.initialFilter;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: FilterType.values.map((item) {
        return InkWell(
          onTap: () {
            setState(() {
              filterType = filterType == item ? FilterType.month : item;
              widget.onFilterSelected(filterType);
            });
          },
          child: AnimatedOpacity(
            opacity: filterType == item ? 1.0 : 0.6,
            duration: const Duration(milliseconds: 300),
            child: Material(
              borderRadius: BorderRadius.circular(35),
              color: filterType == item
                  ? const Color.fromRGBO(159, 134, 192, 1)
                  : Colors.transparent,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8.0,
                  horizontal: 16.0,
                ),
                child: Row(
                  children: [
                    Icon(
                      item == FilterType.day
                          ? Icons.star_border_rounded
                          : (item == FilterType.month
                              ? Icons.calendar_view_month
                              : Icons.calendar_today),
                      color: filterType == item
                          ? Colors.white
                          : Colors.grey.shade700,
                      size: 16.0,
                    ),
                    const SizedBox(width: 8.0),
                    Text(
                      item.toString().split('.').last,
                      style: GoogleFonts.comfortaa(
                        fontSize: 11,
                        color: filterType == item
                            ? Colors.white
                            : Colors.grey.shade700,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
