import 'package:equatable/equatable.dart';

class QueryItems<T extends Equatable> extends Equatable {
  final List<T> items;
  final int totalPages;
  final int currentPage;

  bool get hasMorePages => currentPage < totalPages;

  const QueryItems({
    required this.items,
    required this.totalPages,
    required this.currentPage,
  });

  factory QueryItems.empty() {
    return const QueryItems(
      items: [],
      totalPages: 0,
      currentPage: 0,
    );
  }

  QueryItems<T> merge(QueryItems<T> other) {
    assert(totalPages == other.totalPages);
    assert(other.currentPage == currentPage + 1);

    List<T> newItems = List.from(items);
    newItems.addAll(other.items);

    return QueryItems<T>(items: newItems, totalPages: totalPages, currentPage: currentPage + 1);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [items, totalPages, currentPage];
}
