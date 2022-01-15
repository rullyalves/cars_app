
class FilterChain<T> {
  FilterChain(this.filters);

  final List<Filter<T>> filters;

  List<T> doFilter(List<T> items) {
    final filterIterator = filters.iterator;

    while (filterIterator.moveNext()) {
      final currentFilter = filterIterator.current;
      items = currentFilter(items);
    }

    return items;
  }
}

typedef Filter<T> = List<T> Function(List<T> items);
