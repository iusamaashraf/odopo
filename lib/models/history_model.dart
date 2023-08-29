class HistoryModel {
  String image;
  String title;
  String detail1;
  String detail2;
  String date;
  String price;
  HistoryModel({
    required this.image,
    required this.title,
    required this.detail1,
    required this.detail2,
    required this.date,
    required this.price,
  });
}

List<HistoryModel> historyLits = [
  HistoryModel(
      image: 'assets/images/ring.png',
      title: 'Diamond ring',
      detail1: 'Gross Weight : 1.49 gm',
      detail2: 'Diamond Weight : 0.14ct',
      date: '20 july, 2022',
      price: '\$10000'),
  HistoryModel(
      image: 'assets/images/watch.png',
      title: 'Diamond ring',
      detail1: 'Gross Weight : 1.49 gm',
      detail2: 'Diamond Weight : 0.14ct',
      date: '20 july, 2022',
      price: '\$10000'),
];
