import 'package:e_commerce/features/shop/controller/product/image_controller.dart';
import 'package:e_commerce/features/shop/models/product_model.dart';
import 'package:e_commerce/features/shop/models/product_variation_model.dart';
import 'package:get/get.dart';

class VariationController extends GetxController {
  static VariationController get instance => Get.find();

  /// variables
  RxMap<String, dynamic> selectedAttributes = <String, dynamic>{}.obs;
  Rx<ProductVariationModel> selectedVariation =
      ProductVariationModel.empty().obs;
  RxString variationStockStatus = ''.obs;

  // select attribute and variation
  void onAttributeSelected(
      ProductModel product,
      attributeName,
      attributeValue,
      ) {
    Map<String, dynamic> selectedAttribute = Map<String, dynamic>.from(
      selectedAttributes.value,
    );

    selectedAttribute[attributeName] = attributeValue;
    selectedAttributes[attributeName] = attributeValue;

    ProductVariationModel selectedVariation = product.productVariations!
        .firstWhere(
          (variation) => isSameAttributeValue(
        variation.attributeValues,
        selectedAttributes.value,   // ✅ FIXED HERE
      ),
      orElse: () => ProductVariationModel.empty(),
    );

    if (selectedVariation.image.isNotEmpty) {
      ImageController.instance.selectedProductImage.value =
          selectedVariation.image;
    }

    this.selectedVariation(selectedVariation);
    getProductVariationsStockStatus();
  }

  bool isSameAttributeValue(
      Map<String, dynamic> variationAttributes,
      Map<String, dynamic> selectedAttributes,
      ) {
    if (variationAttributes.length != selectedAttributes.length) return false;

    for (final key in variationAttributes.keys) {
      if (variationAttributes[key] != selectedAttributes[key]) return false;
    }
    return true;
  }

  Set<String?> getAttributesAvailabilityInVariation(
      List<ProductVariationModel> variations,
      String attributeName,
      ) {
    final availableAttributesValues = variations
        .where(
          (variation) =>
      variation.attributeValues[attributeName]!.isNotEmpty &&
          variation.attributeValues[attributeName] != null &&
          variation.stock > 0,
    )
        .map((variation) => variation.attributeValues[attributeName])
        .toSet();

    return availableAttributesValues;
  }

  String getVariationPrice() {
    return (selectedVariation.value.salePrice > 0
        ? selectedVariation.value.salePrice
        : selectedVariation.value.price)
        .toStringAsFixed(0);
  }

  /// check variation stock status
  void getProductVariationsStockStatus() {
    variationStockStatus.value = selectedVariation.value.stock > 0
        ? 'in stock'
        : 'out of stock';
  }
}