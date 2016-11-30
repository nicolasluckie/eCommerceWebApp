using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Assignment_3 {
    public class ShoppingCartItem {
        public Product Product { get; set; }
        public int Quantity { get; set; }
        public float Total {
            get {
                return (Product.Price * Quantity);
            }
        }

        public ShoppingCartItem(Product product, int quantity) {
            this.Product = product;
            this.Quantity = quantity;
        }
    }
}