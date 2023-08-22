class WishlistHeaderModel {
  String title;
  WishlistHeaderModel({
    required this.title,
  });
}

List<WishlistHeaderModel> headerList = [
  WishlistHeaderModel(title: 'Birthday'),
  WishlistHeaderModel(title: 'Anniversary'),
  WishlistHeaderModel(title: 'First meet'),
  WishlistHeaderModel(title: 'Other'),
];
