-- Create department table
CREATE TABLE department (
                            id SERIAL PRIMARY KEY,
                            department VARCHAR(50) NOT NULL
);

-- Insert departments
INSERT INTO department (department)
VALUES ('marketing'), ('engineering'), ('sales'), ('finance'), ('human resources'),
       ('customer support'), ('research and development'), ('information technology'), ('legal'), ('operations');

-- Create employee table
CREATE TABLE employee (
                          id SERIAL PRIMARY KEY,
                          first_name VARCHAR(50) NOT NULL,
                          last_name VARCHAR(50) NOT NULL,
                          salary INTEGER NOT NULL,
                          department_id INTEGER REFERENCES department(id) NOT NULL
);

-- Generate 1,000,000 random employees
INSERT INTO employee (first_name, last_name, salary, department_id)
SELECT
        'First' || TRUNC(random() * 1000000)::text AS first_name,
        'Last' || TRUNC(random() * 1000000)::text AS last_name,
        TRUNC(random() * 1000000) AS salary,
        (TRUNC(random() * 10) + 1) AS department_id
FROM generate_series(1, 1000000);
