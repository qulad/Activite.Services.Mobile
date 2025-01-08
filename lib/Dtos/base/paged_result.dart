class PagedResult<T> {
  late List<T> items;
  late bool isEmpty;
  late bool isNotEmpty;
  late int currentPage;
  late int totalPages;
  late int totalResults;

  PagedResult({
    required this.items,
    required this.isEmpty,
    required this.isNotEmpty,
    required this.currentPage,
    required this.totalPages,
    required this.totalResults,
  });
}