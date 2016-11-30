using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Assignment_3 {
    public static class ShoppingCartManager {
        public static List<ShoppingCartItem> Items = new List<ShoppingCartItem>();

        public static void AddItem(ShoppingCartItem itemToAdd) {
            bool found = false;

            // If the item is not in the shopping cart, add it
            if (Items.Count == 0) {
                Items.Add(itemToAdd);
            }
            // If the item is in the shopping cart, update the quantity
            else {

                // Cycle through the items to find the corrisponding item
                foreach (ShoppingCartItem item in Items) {
                    if (item.Product.Name == itemToAdd.Product.Name) {
                        item.Quantity += itemToAdd.Quantity;
                        found = true;
                    }
                }
                // If the above loop didn't update the item, it's not in the
                // shopping cart, so add it!
                if (!found) {
                    Items.Add(itemToAdd);
                }
            }

            
        }

        public static void RemoveItem(string name) {
            foreach (ShoppingCartItem item in Items) {
                if (item.Product.Name == name) {
                    Items.Remove(item);
                    return;
                }
            }
        }

        public static void PrintItems() {
            System.Diagnostics.Debug.WriteLine("------------- START ------------");
            foreach (ShoppingCartItem item in ShoppingCartManager.Items) {
                System.Diagnostics.Debug.WriteLine(item.Product.Name + " - " + item.Quantity + " - $" + item.Total);
            }
            System.Diagnostics.Debug.WriteLine("-------------- END -------------");
        }
    }
}