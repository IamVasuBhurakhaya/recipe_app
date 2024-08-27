# Recipe App

## Overview

This recipe app allows users to browse, filter, and manage recipes through a user-friendly interface. The app provides functionalities to add recipes to meals, mark them as favorites, and manage them in an organized manner.

## Features

### HomePage
- **Display:** Shows all recipes in an aesthetically pleasing and organized UI.
- **Events:**
  - **Go to Detail Page:** Navigate to the Detail Page of the selected recipe.
  - **Add to Meal:** Add the recipe to the Meal Page.
  - **Add to Favourite:** Mark the recipe as a favorite and add it to the Favourite Page.
- **Filters:** Users can filter recipes by:
  - **Tags**
  - **Meal Type**
  - **Prep + Cooking Time**

### DetailPage
- **Display:** Shows the detailed information of the selected recipe, including all available data.
  - **Ingredients and Instructions:** Only the count of ingredients and instructions is displayed.
- **Events:**
  - **Add to Meal:** Add the recipe to the Meal Page.
  - **Add to Favourite:** Mark the recipe as a favorite and add it to the Favourite Page.

### RecipePage
- **Display:** Focuses on displaying the recipe's ingredients and instructions in detail.
- **Events:**
  - **Add to Meal:** Add the recipe to the Meal Page.
  - **Add to Favourite:** Mark the recipe as a favorite and add it to the Favourite Page.

### MealPage
- **Display:** Functions similarly to a cart page, listing all recipes added to the meal.
  - **Total Calculation:** Automatically calculates the total time, calories, and servings of all recipes in the meal.
- **Events:**
  - **Add to Favourite:** Mark the recipe as a favorite and add it to the Favourite Page.
  - **Remove from Meal Page:** Remove the recipe from the Meal Page.
  - **Increase/Decrease Servings:** Adjust the number of servings for the selected recipe.

### FavouritePage
- **Display:** Lists all recipes marked as favorites.
- **Events:**
  - **Remove from Favourite:** Unmark the recipe as a favorite and remove it from the Favourite Page.

