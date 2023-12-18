/// Responsive breakpoints for the app
enum CustomResponsiveBreakpoints {
  /// [phone] 0 - 450
  phone(start: 0, end: 450, name: 'PHONE'),

  /// [tablet] 451 - 800
  tablet(start: 451, end: 800, name: 'TABLET'),

  /// [desktop] 801 - 1920
  desktop(start: 801, end: 1920, name: 'DESKTOP'),

  /// [4K] 1921 - infinity
  fourK(start: 1921, end: double.infinity, name: '4K');

  const CustomResponsiveBreakpoints({
    required this.start,
    required this.end,
    required this.name,
  });

  /// Start value of the breakpoint
  final double start;

  /// End value of the breakpoint
  final double end;

  /// Name of the breakpoint
  final String name;
}
