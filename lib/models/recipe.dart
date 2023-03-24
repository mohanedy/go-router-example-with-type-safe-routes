class Recipe {
  const Recipe(
    this.id,
    this.name,
    this.details,
    this.imageUrl,
  );

  final int id;
  final String name;
  final String details;
  final String imageUrl;

// A dummy array of recipes
  static List<Recipe> recipes = const [
    Recipe(
        1,
        "Banana Bread",
        "A moist and delicious bread made with ripe bananas, honey and walnuts. This recipe is easy to make and perfect for breakfast or snack. You can enjoy it plain or with some butter or jam.",
        "https://images.unsplash.com/photo-1512621425532-58df884d97b0?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8YmFuYW5hJTIwYnJlYWR8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
    Recipe(
        2,
        "Chicken and Mushroom Pie",
        "A hearty and comforting pie filled with chicken, mushrooms and a creamy sauce, topped with puff pastry. This pie is great for using up leftover chicken or turkey, and can be made ahead and frozen for later. Serve it with some green beans or peas for a complete meal.",
        "https://images.unsplash.com/photo-1572449043416-55f4685c9bb7?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8Y2hpY2tlbiUyMGFuZCUyMG11c2hyb29tJTIwcGllfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
    Recipe(
        3,
        "Spaghetti Carbonara",
        "A classic Italian pasta dish with bacon, eggs and cheese. This dish is simple but satisfying, and can be made in less than 30 minutes. The key is to toss the hot pasta with the egg and cheese mixture quickly, so that it forms a creamy sauce without scrambling the eggs.",
        "https://images.unsplash.com/photo-1555949258-eb67b1ef0ceb?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8c3BhZ2hldHRpJTIwY2FyYm9uYXJhfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
    Recipe(
        4,
        "Chocolate Cake",
        "A rich and decadent chocolate cake with a fudgy frosting. This cake is moist and fluffy, with a deep chocolate flavor. The frosting is made with melted chocolate and butter, and spread over the cake while still warm. This cake is perfect for any occasion, from birthdays to holidays.",
        "https://images.unsplash.com/photo-1565808229224-264b6a7579a9?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8Y2hvY29sYXRlJTIwY2FrZXxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
    Recipe(
        5,
        "Salmon Salad",
        "A fresh and healthy salad with grilled salmon, greens, avocado and a lemon dressing. This salad is high in protein and omega-3 fatty acids, and low in carbs. The lemon dressing adds a zesty flavor and complements the salmon well. You can use any greens you like, such as spinach, kale or lettuce.",
        "https://images.unsplash.com/photo-1543352634-a1c51d9f1fae?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8c2FsbW9uJTIwc2FsYWR8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
    Recipe(
        6,
        "Lasagna",
        "A classic Italian dish with layers of pasta, meat sauce, cheese and béchamel sauce. This lasagna is hearty anddelicious and comforting. You can make your own meat sauce and béchamel sauce, or use store-bought ones to save time. You can also use fresh or dried pasta sheets, depending on your preference.",
        "https://images.unsplash.com/photo-1516684669134-de6f7c473a2a?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8bGFzYWduYXxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
    Recipe(
        7,
        "Vegetable Curry",
        "A spicy and aromatic curry with mixed vegetables, coconut milk and curry paste. This curry is vegan and gluten-free, and can be customized with your favorite vegetables. You can use any curry paste you like, such as red, green or yellow. Serve it with rice or naan bread for a satisfying meal.",
        "https://images.unsplash.com/photo-1585937421612-70c3dfe9178a?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8dmVnZXRhYmxlJTIwY3Vycnl8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
    Recipe(
        8,
        "Cheeseburger",
        "A juicy and flavorful burger with cheese, lettuce, tomato, onion and ketchup. This burger is easy to make and can be grilled or pan-fried. You can use any cheese you like, such as cheddar, swiss or blue cheese. You can also add other toppings, such as bacon, mushrooms or avocado.",
        "https://images.unsplash.com/photo-1551615593-ef5fe247e8f7?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8Y2hlZXNlYnVyZ2VyfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
    Recipe(
        9,
        "Apple Pie",
        "A classic dessert with a flaky crust and a sweet and spiced apple filling. This pie is best served warm with some vanilla ice cream or whipped cream. You can use any apples you like, but tart ones like Granny Smith work well. You can also add some raisins or nuts to the filling for extra texture and flavor.",
        "https://images.unsplash.com/photo-1512058454905-6b841e7ad132?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8YXBwbGUlMjBwaWV8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
    Recipe(
        10,
        "Chicken Soup",
        "A soothing and nourishing soup with chicken, vegetables and noodles. This soup is easy to make and perfect for cold days or when you are feeling under the weather. You can use any vegetables you like, such as carrots, celery, onion or potato. You can also add some herbs, such as parsley, thyme or bay leaf.",
        "https://images.unsplash.com/photo-1547592166-23ac45744acd?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8Y2hpY2tlbiUyMHNvdXB8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
    Recipe(
        11,
        "Pizza",
        "A popular dish with a thin crust topped with tomato sauce, cheese and various toppings. This pizza is easy to make at home and can be customized with your favorite toppings. You can use ready-made pizza dough or make your own from scratch. You can also use different cheeses, such as mozzarella, parmesan or feta.",
        "https://images.unsplash.com/photo-1571407970349-bc81e7e96d47?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8cGl6emF8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
  ];
}
