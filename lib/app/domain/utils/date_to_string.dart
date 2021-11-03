final months = [
  'January',
  'February',
  'March',
  'April',
  'May',
  'June',
  'July',
  'Agost',
  'September',
  'October',
  'November',
  'December'
];

String dateToStringFormat(DateTime? date) {
  if (date != null) {
    return "${months[date.month - 1]} ${date.day}, ${date.year}";
  } else {
    return "Date added not defined";
  }
}
