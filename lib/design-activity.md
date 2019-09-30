What classes does each implementation include? Are the lists the same? Write down a sentence to describe each class. How do the classes relate to each other? It might be helpful to draw a diagram on a whiteboard or piece of paper.

Both classes have a ShoppingCart class that holds the entries. Both classes also have Order which is both creating a new instance of shoppingcart and tallying up the order amount + tax. We know that CartEntry is going to keep track of unit price and quantity vs ShoppingCart which is just storing the items for that specific person. Price is used twice in B to first calculate unit price and quantity and then again within the shopping cart class to calculate the total amount of the shopping cart. 

What data does each class store? How (if at all) does this differ between the two implementations? What methods does each class have? How (if at all) does this differ between the two implementations?

A and B both have a order, shopping cart, and total price. In A and B we are creating a new shopping cart in order. In A we iterate each instance of cart (in total price) in order to get the price of Cart and then we use the Sales Tax (constant) to get the total whereas in B we get the sub-total (pre tax) by calling the price method on cart. Then we use the sales tax to get the total amount.

Consider the Order#total_price method. In each implementation: Is logic to compute the price delegated to "lower level" classes like ShoppingCart and CartEntry, or is it retained in Order? 

For A, the logic for getting price is in Order. In B, its a 'lower level' function.

Does total_price directly manipulate the instance variables of other classes? If we decide items are cheaper if bought in bulk, how would this change the code? Which implementation is easier to modify?
Which implementation better adheres to the single responsibility principle?