CREATE TABLE all_products (
                              product_id INTEGER,
                              product_name VARCHAR(255),
                              sku INTEGER,
                              distributor_id INTEGER,
                              PRIMARY KEY (product_id)
);

CREATE TABLE orders (
                        date VARCHAR(10),
                        user_id INTEGER,
                        order_id INTEGER,
                        product_id INTEGER,
                        no_units INTEGER,
                        price INTEGER,
                        shipping_id INTEGER,
                        region VARCHAR(255),
                        PRIMARY KEY (order_id),
                        FOREIGN KEY (product_id) REFERENCES all_products(product_id)
);


-- Insert:
-- Insert data into "all_products" table
INSERT INTO all_products (product_id, product_name, sku, distributor_id)
VALUES
    (1, 'Product A', 12345, 100),
    (2, 'Product B', 67890, 101),
    (3, 'Product C', 54321, 102),
    (4, 'Product D', 98765, 103),
    (5, 'Product E', 24680, 104);

INSERT INTO all_products (product_id, product_name, sku, distributor_id)
VALUES
    (11, 'Product K', 11111, 110),
    (12, 'Product L', 22222, 111),
    (13, 'Product M', 33333, 112),
    (14, 'Product N', 44444, 113),
    (15, 'Product O', 55555, 114),
    (16, 'Product P', 66666, 115),
    (17, 'Product Q', 77777, 116),
    (18, 'Product R', 88888, 117),
    (19, 'Product S', 99999, 118),
    (20, 'Product T', 12345, 119)
    (11, 'Product K', 11111, 110),
    (12, 'Product L', 22222, 111),
    (13, 'Product M', 33333, 112),
    (14, 'Product N', 44444, 113),
    (15, 'Product O', 55555, 114),
    (16, 'Product P', 66666, 115),
    (17, 'Product Q', 77777, 116),
    (18, 'Product R', 88888, 117),
    (19, 'Product S', 99999, 118),
    (20, 'Product T', 12345, 119);
-- Continue with the remaining 95 data points

-- Insert data into "orders" table
INSERT INTO orders (date, user_id, order_id, product_id, no_units, price, shipping_id, region)
VALUES
    ('2023-01-01', 1001, 1, 1, 2, 10, 1, 'Region A'),
    ('2023-01-02', 1002, 2, 2, 1, 15, 2, 'Region B'),
    ('2023-01-03', 1003, 3, 1, 5, 12, 3, 'Region C'),
    ('2023-01-04', 1004, 4, 3, 3, 8, 4, 'Region A'),
    ('2023-01-05', 1005, 5, 4, 2, 20, 5, 'Region B')
-- Continue with the remaining 95 data points

INSERT INTO orders (date, user_id, order_id, product_id, no_units, price, shipping_id, region)
VALUES
    ('2023-01-13', 1013, 13, 11, 5, 14, 13, 'Region A'),
    ('2023-01-14', 1014, 14, 12, 3, 16, 14, 'Region B'),
    ('2023-01-15', 1015, 15, 12, 2, 20, 15, 'Region C');

-- Insert data into "orders" table for year 2017, quarter 4
INSERT INTO orders (date, user_id, order_id, product_id, no_units, price, shipping_id, region)
VALUES
    ('2017-10-01', 1001, 122, 11, 2, 10, 1, 'Region A'),
    ('2017-10-02', 1002, 233, 12, 1, 15, 2, 'Region B'),
    ('2017-10-15', 1003, 344, 11, 5, 12, 3, 'Region C'),
    ('2017-11-05', 1004, 455, 13, 3, 8, 4, 'Region A'),
    ('2017-11-15', 1005, 566, 14, 2, 20, 5, 'Region B'),
    ('2017-12-03', 1006, 677, 15, 3, 18, 6, 'Region C'),
    ('2017-12-05', 1007, 788, 16, 1, 25, 7, 'Region A'),
    ('2017-12-15', 1008, 8909, 17, 2, 12, 8, 'Region B'),
    ('2017-12-20', 1009, 769, 15, 4, 15, 9, 'Region C'),
    ('2017-12-31', 1010, 1660, 18, 3, 22, 10, 'Region A');
