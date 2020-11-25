import 'package:my_news_app/models/category_model.dart';

List<CategoryModel> getCategories() {
  List<CategoryModel> category = new List<CategoryModel>();
  CategoryModel categoryModel = CategoryModel();

  //1
  categoryModel.categoryName = "Business";
  categoryModel.imgURL =
      "https://images.unsplash.com/photo-1486406146926-c627a92ad1ab?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80";
  category.add(categoryModel);
  categoryModel = CategoryModel();

  //2
  categoryModel = CategoryModel();
  categoryModel.categoryName = "Entertainment";
  categoryModel.imgURL =
      "https://images.unsplash.com/photo-1526515808447-f75a9f2e5f9f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80";
  category.add(categoryModel);

  //3
  categoryModel = CategoryModel();
  categoryModel.categoryName = "General";
  categoryModel.imgURL =
      "https://images.unsplash.com/photo-1504711434969-e33886168f5c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80";
  category.add(categoryModel);

  //4
  categoryModel = CategoryModel();
  categoryModel.categoryName = "Sports";
  categoryModel.imgURL =
      "https://images.unsplash.com/photo-1508098682722-e99c43a406b2?ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80";
  category.add(categoryModel);

  //5
  categoryModel = CategoryModel();
  categoryModel.categoryName = "Technology";
  categoryModel.imgURL =
      "https://images.unsplash.com/photo-1518770660439-4636190af475?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80";
  category.add(categoryModel);

  //6
  categoryModel = CategoryModel();
  categoryModel.categoryName = "Health";
  categoryModel.imgURL =
      "https://images.unsplash.com/photo-1494390248081-4e521a5940db?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=995&q=80";
  category.add(categoryModel);

  //7
  categoryModel = CategoryModel();
  categoryModel.categoryName = "Science";
  categoryModel.imgURL =
      "https://images.unsplash.com/photo-1574170609519-d1d8d4b71f60?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80";
  category.add(categoryModel);

  return category;
}
