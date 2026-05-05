class Category {
  final String title;
  final String image;

  Category({
   required this.title,
   required this.image,
});
}

final List<Category> categoriesList = [
  Category(
    title: "All",
    image: "images/livingroom.jpg",
  ),
  Category(
      title: "Living Room",
      image: "images/livingroom.jpg",
  ),
  Category(
    title: "Bedroom",
    image: "images/bedroom.jpg",
  ),
  Category(
    title: "Bathroom",
    image: "images/baathroom.jpg",
  ),
  Category(
    title: "Kitchen",
    image: "images/kitchen.jpg",
  ),
  Category(
    title: "Dining",
    image: "images/dining.jpg",
  ),
  Category(
    title: "Home",
    image: "images/homeoffice.jpg",
  ),
];