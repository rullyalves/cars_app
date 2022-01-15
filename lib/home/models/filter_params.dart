class FilterParams {
  final List<int> colors;
  final List<int> brands;
 
  FilterParams(this.colors, this.brands);

  bool get isEmpty => brands.isEmpty && colors.isEmpty;
}
