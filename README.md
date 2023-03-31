# ecommerce_shop_app

Shopping Cart app.


## App Feature

#App Contain 3 Screens

- Product list Screen.

 Display product items in grid view. Top bar Contain Cart item with badge. Use that to move cart screen.  Can move to detail page by clicking on the grid item. Grid item also has cart icon . use that to add item to cart.
 
- Product Detail Screen.

 Product detail display on this Screen. User can add product to cart by clicking  "Add to Cart" button. Top bar contain Cart icon with badge. used that to  move Cart Screen. Badge display home many product on the cart. 
  
  
- Cart Screen.

Display cart total and list of products. By swiping left can remove item on cart. 


# These are the packages used in the app
-provider 

provider package used to manage state on the app. Register two notifier for this app. Product notifier and cart notifier. When update happen on product list will rebuild the notifyListeners widget. 

-http

 Used this package to call network request. 

-cached_network_image

This will cached network image. It is very efficient than using Image.network()
 
