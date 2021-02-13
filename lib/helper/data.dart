import 'package:news_assignment_application/models/category_model.dart';

List<CategoryModel> getCategories(){
  List<CategoryModel> category= new List<CategoryModel>();
  CategoryModel categoryModel;

  //1st Category
  categoryModel= new CategoryModel();
  categoryModel.categoryName="Business";
  categoryModel.imageUrl="https://images.unsplash.com/photo-1514580426463-fd77dc4d0672?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=330&q=80";
  category.add(categoryModel);

  //2
  categoryModel= new CategoryModel();
  categoryModel.categoryName="Entertainment";
  categoryModel.imageUrl="https://images.unsplash.com/photo-1514580426463-fd77dc4d0672?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=330&q=80";
  category.add(categoryModel);


  //3
  categoryModel= new CategoryModel();
  categoryModel.categoryName="General";
  categoryModel.imageUrl="https://images.unsplash.com/photo-1514580426463-fd77dc4d0672?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=330&q=80";
  category.add(categoryModel);

  //4
  categoryModel= new CategoryModel();
  categoryModel.categoryName="Health";
  categoryModel.imageUrl="https://images.unsplash.com/photo-1514580426463-fd77dc4d0672?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=330&q=80";
  category.add(categoryModel);

  //5
  categoryModel= new CategoryModel();
  categoryModel.categoryName="Science";
  categoryModel.imageUrl="https://images.unsplash.com/photo-1514580426463-fd77dc4d0672?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=330&q=80";
  category.add(categoryModel);

  //6
  categoryModel= new CategoryModel();
  categoryModel.categoryName="Sports";
  categoryModel.imageUrl="https://images.unsplash.com/photo-1514580426463-fd77dc4d0672?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=330&q=80";
  category.add(categoryModel);

  //7
  categoryModel= new CategoryModel();
  categoryModel.categoryName="Technology";
  categoryModel.imageUrl="https://images.unsplash.com/photo-1514580426463-fd77dc4d0672?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=330&q=80";
  category.add(categoryModel);

  categoryModel= new CategoryModel();

  return category;
}