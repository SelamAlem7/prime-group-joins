-- ## Tasks

-- ##ALL TABLES AND THRI COLUMS:
------------------------------------------------------------------------
"addresses" = id, street, city, state, zip, address_type, customer_id*
------------------------------------------------------------------------
"customers" = first_name, last_name
------------------------------------------------------------------------
"line_items" = id, quantity, order_id*, product_id*
------------------------------------------------------------------------
"orders" = id, order_date, address_id*
------------------------------------------------------------------------
"products" = id, description, unit_price
------------------------------------------------------------------------
"warehouse" = id, warehouse, fulfillment_days
------------------------------------------------------------------------
"warehouse_product" = product_id*, warehouse_id*, on_hand*
------------------------------------------------------------------------


-- 1. Get all customers and their addresses.
        SELECT * FROM "customers"
	        INNER JOIN "addresses" ON "customer_id"="customers"."id";




-- 2. Get all orders and their line items (orders, quantity and product).
        SELECT * FROM "orders"
            JOIN "line_items"
              ON "orders"."id"="line_items"."order_id"
            JOIN "products"
              ON "line_items"."order_id"="products"."id"
    
    


-- 3. Which warehouses have cheetos?

    SELECT * FROM "warehouse_product"
        JOIN "products"
            ON "warehouse_product"."product_id"="products"."id"
                WHERE products.description = 'cheetos'



-- 4. Which warehouses have diet pepsi?
SELECT * FROM "warehouse"
	JOIN "warehouse_product"
    	ON "warehouse"."id"="warehouse_product"."warehouse_id"
    	 JOIN "products"
    		ON "warehouse_product"."product_id"="products"."id" 
    			WHERE products.description = 'diet pepsi'
    			
  


-- 5. Get the number of orders for each customer. 
--    NOTE: It is OK if those without orders are not included in results.
SELECT "customers".* FROM "customers"
	JOIN "addresses"
    	ON "customers"."id"="addresses"."customer_id"
    	 JOIN "orders"
    		ON "addresses"."id"="orders"."address_id" 
    			GROUP BY "customers"."id";




-- 6. How many customers do we have? = Answer: 4
            SELECT COUNT(*) FROM customers;




-- 7. How many products do we carry? = Answer: 7
    SELECT COUNT(*) FROM products 

    -- or, products in line would be = Answer: 26
        SELECT COUNT(*) FROM products
	        JOIN "line_items"
    	        ON "products"."id"="line_items"."product_id"

    -- or the same as doing = Answer: 26
        SELECT COUNT(*) FROM line_items
    	




-- 8. What is the total available on-hand quantity of diet pepsi? = Answer: 92
        SELECT SUM(on_hand) FROM "warehouse_product"
	        JOIN "products"
    	        ON "warehouse_product"."product_id"="products"."id"
   			        WHERE products.description = 'diet pepsi'







-----------------------------------------------------------------------------------------------------------------------------------------------

-- ## Stretch
-- 9. How much was the total cost for each order?
-- 10. How much has each customer spent in total?
-- 11. How much has each customer spent in total? Customers who have spent $0 should still show up in the table. It should say 0, not NULL (research coalesce).