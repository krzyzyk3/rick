import 'package:equatable/equatable.dart';

class QueryItems<T extends Equatable> extends Equatable {
  final List<T> items;
  final int totalPages;
  final int currentPage;

  const QueryItems({
    required this.items,
    required this.totalPages,
    required this.currentPage,
  });

  bool get hasMorePages => currentPage < totalPages;

  QueryItems<T> merge(QueryItems<T> other) {
    assert(totalPages == other.totalPages);
    assert(currentPage == other.currentPage + 1);

    List<T> newItems = List.from(items);
    newItems.addAll(other.items);

    return QueryItems<T>(items: newItems, totalPages: totalPages, currentPage: currentPage);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [items, totalPages, currentPage];
}
