select * from customer;

-- we need to find the moving average of how much the customer paid in a 7 days window = current date + 6 days before.
-- average_amount should be rounded to 2 decimal places.


select
    t.visited_on,
    round(sum(t.amount*1.00) over (order by visited_on rows between 6 preceding and current row),2) as "amount",
    round(avg(t.amount*1.00) over (order by visited_on rows between 6 preceding and current row),2) as "avg_amount"
from
(select
    visited_on,
    sum(amount) as amount
from customer
group by
    visited_on) as t
offset 6 rows;



/* DDL ::

CREATE TABLE Customer (
                          customer_id INT,
                          name VARCHAR(255),
                          visited_on DATE,
                          amount NUMERIC(10, 2)
);

INSERT INTO Customer (customer_id, name, visited_on, amount)
VALUES
    (1, 'Jhon', '2019-01-01', 100),
    (2, 'Daniel', '2019-01-02', 110),
    (3, 'Jade', '2019-01-03', 120),
    (4, 'Khaled', '2019-01-04', 130),
    (5, 'Winston', '2019-01-05', 110),
    (6, 'Elvis', '2019-01-06', 140),
    (7, 'Anna', '2019-01-07', 150),
    (8, 'Maria', '2019-01-08', 80),
    (9, 'Jaze', '2019-01-09', 110),
    (1, 'Jhon', '2019-01-10', 130),
    (3, 'Jade', '2019-01-10', 150);
*/