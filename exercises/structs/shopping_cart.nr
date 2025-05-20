// shopping_cart.nr
// use the `hint` watch subcommand for a hint.

struct Product {
    id: Field,
    price: Field,
    quantity: Field,
}

struct Cart {
    items: [Product; 3],
    total_items: Field,
}

impl Cart {
    // TODO: Implement the following methods for Cart:
    // 1. new() - creates an empty cart with zero items
    // 2. add_product(product: Product) -> bool - adds a product if total_items < 3
    fn new() -> Cart {
        let product = Product { id: 0, price: 0, quantity: 0 };
        Cart { items: [product; 3], total_items: 0 }
    }

    fn add_product(&mut self, product: Product) -> bool {
        if self.total_items as u64 >= 3 {
            false
        } else {
            self.items[self.total_items as u64] = product;
            self.total_items += 1;
            true
        }
    }

    fn calculate_total(self) -> Field {
        let mut total = 0;
        for i in 0..self.total_items as u64 {
            total = total + self.items[i].price * self.items[i].quantity;
        }
        total
    }
}

// DO NOT CHANGE ANY CODE BELOW
fn main() {
    let mut cart = Cart::new();

    let product1 = Product { id: 1, price: 10, quantity: 2 };

    let product2 = Product { id: 2, price: 15, quantity: 1 };

    assert(cart.add_product(product1));
    assert(cart.add_product(product2));
    print(cart.items);
    print(cart.total_items);
    assert(cart.total_items == 2);
    assert(cart.calculate_total() == 35); // (10 * 2) + (15 * 1)
}

#[test]
fn test_cart() {
    main();
}
