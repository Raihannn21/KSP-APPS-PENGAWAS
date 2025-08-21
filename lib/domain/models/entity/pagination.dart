class Pagination {
  int? page;
  int? perPage;
  int? lastPage;
  int? start;
  int? end;
  int? total;

  Pagination({
    this.page,
    this.perPage,
    this.lastPage,
    this.start,
    this.end,
    this.total
  });

  Pagination.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    perPage = json['perPage'];
    lastPage = json['lastPage'];
    start = json['start'];
    end = json['end'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['page'] = page;
    data['perPage'] = perPage;
    data['lastPage'] = lastPage;
    data['start'] = start;
    data['end'] = end;
    data['total'] = total;
    return data;
  }
}
