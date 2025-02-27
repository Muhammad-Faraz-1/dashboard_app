// import 'dart:convert';

class ProductResponse {
  final String message;
  final String categoryName;
  final List<Product> products;
  final Pagination pagination;

  ProductResponse({
    required this.message,
    required this.categoryName,
    required this.products,
    required this.pagination,
  });

  factory ProductResponse.fromJson(Map<String, dynamic> json) {
    return ProductResponse(
      message: json['message'],
      categoryName: json['categoryName'],
      products: (json['products'] as List).map((e) => Product.fromJson(e)).toList(),
      pagination: Pagination.fromJson(json['pagination']),
    );
  }
}

class Product {
  final String id;
  final int uid;
  final String name;
  final String slug;
  final String permalink;
  final String type;
  final String status;
  final int featured;
  final String description;
  final String shortDescription;
  final String sku;
  final String regularPrice;
  final Discount discount;
  final String salePrice;
  final Brand brand;
  final StockManagement manageStock;
  final int allowBackOrder;
  final int soldIndividually;
  final int shippingRequired;
  final int shippingTaxable;
  final List<Attribute> attributes;
  final List<Category> categories;
  final List<ProductImage> images;
  final String price;
  final String weightDimention;

  Product({
    required this.id,
    required this.uid,
    required this.name,
    required this.slug,
    required this.permalink,
    required this.type,
    required this.status,
    required this.featured,
    required this.description,
    required this.shortDescription,
    required this.sku,
    required this.regularPrice,
    required this.discount,
    required this.salePrice,
    required this.brand,
    required this.manageStock,
    required this.allowBackOrder,
    required this.soldIndividually,
    required this.shippingRequired,
    required this.shippingTaxable,
    required this.attributes,
    required this.categories,
    required this.images,
    required this.price,
    required this.weightDimention
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['_id'],
      uid: json['uid'],
      name: json['name'],
      slug: json['slug'],
      permalink: json['permalink'],
      type: json['type'],
      status: json['status'],
      featured: json['featured'],
      description: json['description'],
      shortDescription: json['short_description'],
      sku: json['sku'],
      regularPrice: json['regular_price'],
      discount: Discount.fromJson(json['discount']),
      salePrice: json['sale_price'],
      brand: Brand(name: json['brand']),
      manageStock: StockManagement.fromJson(json['manage_stock']),
      allowBackOrder: json['allow_back_order'],
      soldIndividually: json['sold_individually'],
      shippingRequired: json['shipping_required'],
      shippingTaxable: json['shipping_taxable'],
      attributes: (json['attributes'] as List).map((e) => Attribute.fromJson(e)).toList(),
      categories: (json['categories'] as List).map((e) => Category.fromJson(e)).toList(),
      images: (json['images'] as List).map((e) => ProductImage.fromJson(e)).toList(),
      price: json['price'].toString(),
      weightDimention: json['weight_dimension']
    );
  }
}

class Discount {
  final int isDiscountable;
  final String discountType;
  final String discountValue;

  Discount({required this.isDiscountable, required this.discountType, required this.discountValue});

  factory Discount.fromJson(Map<String, dynamic> json) {
    return Discount(
      isDiscountable: json['is_discountable'],
      discountType: json['discount_type'],
      discountValue: json['discount_value'],
    );
  }
}

class Brand {
  final String name;

  Brand({required this.name});
}

class StockManagement {
  final int isStockManage;
  final String location;
  final int quantity;
  final String stockStatus;

  StockManagement({required this.isStockManage, required this.location, required this.quantity, required this.stockStatus});

  factory StockManagement.fromJson(Map<String, dynamic> json) {
    return StockManagement(
      isStockManage: json['is_stock_manage'],
      location: json['location'],
      quantity: json['quantity'],
      stockStatus: json['stock_status'],
    );
  }
}

class Attribute {
  final String id;
  final String name;
  final String type;
  final List<AttributeOption> options;

  Attribute({required this.id, required this.name, required this.type, required this.options});

  factory Attribute.fromJson(Map<String, dynamic> json) {
    return Attribute(
      id: json['_id'],
      name: json['name'],
      type: json['type'],
      options: (json['options'] as List).map((e) => AttributeOption.fromJson(e)).toList(),
    );
  }
}

class AttributeOption {
  final String name;
  final String value;

  AttributeOption({required this.name, required this.value});

  factory AttributeOption.fromJson(Map<String, dynamic> json) {
    return AttributeOption(
      name: json['name'],
      value: json['value'],
    );
  }
}

class Category {
  final int uid;
  final String name;
  final String slug;
  final int ismain; // Add this field

  Category({
    required this.uid,
    required this.name,
    required this.slug,
    required this.ismain,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      uid: json['uid'],
      name: json['name'],
      slug: json['slug'],
      ismain: json['ismain'] ?? 0, // Default to 0 if not present
    );
  }
}


class ProductImage {
  final String imageUrl;

  ProductImage({required this.imageUrl});

  factory ProductImage.fromJson(Map<String, dynamic> json) {
    return ProductImage(imageUrl: json['image_url']);
  }
}

class Pagination {
  final int currentPage;
  final int perPage;
  final int totalProducts;
  final int totalPages;

  Pagination({required this.currentPage, required this.perPage, required this.totalProducts, required this.totalPages});

  factory Pagination.fromJson(Map<String, dynamic> json) {
    return Pagination(
      currentPage: json['currentPage'],
      perPage: json['perPage'],
      totalProducts: json['totalProducts'],
      totalPages: json['totalPages'],
    );
  }
}
