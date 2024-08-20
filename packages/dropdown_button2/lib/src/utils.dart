part of 'dropdown_button2.dart';

/// Adds separators to a list of heights.
///
/// The [itemHeights] property is the list of heights of the items.
///
/// The [separatorHeight] property is the height of the separator.
///
/// Returns a new list of heights with separators added.
List<double> addSeparatorsWidths({
  required List<double> itemWidths,
  required double? separatorWidth,
}) {
  final List<double> widths = [];

  bool addSeparator = false;
  if (separatorWidth != null) {
    for (final item in itemWidths) {
      if (addSeparator) {
        widths.add(separatorWidth);
      }
      widths.add(item);
      addSeparator = true;
    }
  } else {
    widths.addAll(itemWidths);
  }

  return widths;
}

void _uniqueValueAssert<T>(
  List<DropdownItem<T>>? items,
  ValueListenable<T?>? valueListenable,
  ValueListenable<List<T>>? multiValueListenable,
) {
  if (items == null || items.isEmpty) {
    return;
  }

  String assertMessage(T value) {
    return "There should be exactly one item with [DropdownButton]'s value: "
        '$value. \n'
        'Either zero or 2 or more [DropdownItem]s were detected '
        'with the same value';
  }

  assert(
    valueListenable?.value == null ||
        items.where((DropdownItem<T> item) {
              return item.value == valueListenable!.value;
            }).length ==
            1,
    assertMessage(valueListenable!.value as T),
  );

  final currentMultiValue = multiValueListenable?.value.lastOrNull;
  assert(
    currentMultiValue == null ||
        items.where((DropdownItem<T> item) {
              return item.value == currentMultiValue;
            }).length ==
            1,
    assertMessage(currentMultiValue),
  );
}
