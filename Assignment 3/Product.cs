using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Assignment_3 {
    public class Product {
        public int ID { get; set; }
        public string Name { get; set; }
        public float Price { get; set; }
        public string Image { get; set; }
        public string Description { get; set; }

        public Product (int id, string name, float price, string img, string desc) {
            this.ID = id;
            this.Name = name;
            this.Price = price;
            this.Image = img;
            this.Description = desc;
        }
    }
}