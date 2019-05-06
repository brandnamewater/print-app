# Development

```
docker run -d -p 5436:5432 --name print-app_development -e POSTGRES_PASSWORD=print-app-development_password postgres
docker start print-app_development
docker stop print-app_development
```

# Context

Product Model:
  Used as main source of products.  UserProducts and VendorProducts are both created from Products.
  Products are created by Admins only and are seen on the front end by Users to choose to attach to their Shopify Products to then create their UserProducts
  ⦁	Product.vendor_id to be unique
  ⦁	Goal: To have one vendor for each product based on :country
  Products will be created based on Category, Style, color, size, country.
  example:
  Hoodie, Gildan 1850, White, size small, UK location
  How it's created by Admin: Admin chooses a style (Hoodies, T-shirts etc.), then created product with SKU (Hood-Gil1850-White-S-UK), Color (White), Size (S), Location (UK), and print method base pricing (2 print methods).

UserProduct Model:
  Used to store the users products which are attached to their shopify stores products/variables.
  Attaching Store products to Products example:
    Users Store products load to be chosen, user chooses a products which as size variables, all variables are shown to then attach Product to each product.  User chooses Category, Style, and then adds size, color, location, print method, print locations and upload files for each print location.  Based on the print locations chosen by files uploaded, will then depend on the price they are charged.  This will create UserProduct.  We then generate a SKU to attach to the UserProduct and override the SKU within their Shopify stores prodcut they have attached.  We then use this information to associate their Stores Products to their UserProducts for when orders come in... Unless there are other ways?
  Each print method will be calculated by adding on top of the print method chosen base price.
  Each UserProduct is associated to a Product, as well as their stores product API information

  All print location:
  ⦁	Front
  ⦁	Back
  ⦁	Upper Left Sleeve (4 inch length max, upper sleeve)
  ⦁	Upper Right Sleeve
  ⦁	Long Left Sleeve (entire sleeve print)
  ⦁	Long Right Sleeve
  ⦁	Inside Tag
  ⦁	Back Outside Tag

T-shirts will not have Long sleeve prints available.
Outside tag not available if back print is used, vice versa

VendorProduct Model:
  Used to store and attach to Vendors for the products a vendor has available for fulfillment.
  All VendorProducts are created by Admins ONLY.
  VendorProducts are created through Products by the admins.
  VendorProducts will have all of the same information as Products, plus inventory --- and vendor_print_method_1_price and vendor_print_method_2_price; this is the price they are paid to fulfill the orders.
  The only param they are able to edit is the Inventory to keep track of their inventory.  Each time they fulfill an order, the inventory level of the product in the order associated with their product will be minused.


Order Model:
  The order model will have all shipping information, Product information, associated user and vendor information.
  (If a shipping model isn't created::::) ::: We will have shipping/tracking information within the Order model.  The tracking information will be inputted by the Vendor fulfilling the order.
  An order is created either manually or through Shopify API.
  Manual Function:
    User manually creates an order by either creating a new UserProduct or by selecting an existing UserProduct
  API Function:
    User store order comes in through Shopify with a product or products where UserProducts are associated with through SKU.   This creates an order.  The order is then seen by the Vendor because their VendorProduct is associated to the Product the UserProduct is also associated with.
  Fulfillment:
    A vendor will fulfill the order by adding a tracking number to the order.  Once inputted, the order is fulfilled and the API triggers to then fulfill the order within the Shopify store as well by funnelling the tracking information to the Store.


