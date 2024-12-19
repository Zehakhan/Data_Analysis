-- Question: What are the different payment methods, and how many transactions and
-- items were sold with each method?
SELECT 
    COUNT(category), quantity, payment_method AS payment_mehtod
FROM
    walmart_clean_data
GROUP BY payment_method , quantity;

--  Question: Which category received the highest average rating in each branch
WITH AverageRatings AS (
    SELECT 
        category,
        AVG(rating) AS avg_rating,
        Branch
    FROM 
        walmart_clean_data
    GROUP BY 
        category, Branch
)
SELECT 
    category,
    avg_rating,
    Branch
FROM 
    AverageRatings ar
WHERE 
    (Branch, avg_rating) IN (
        SELECT 
            Branch, 
            MAX(avg_rating)
        FROM 
            AverageRatings
        GROUP BY 
            Branch
    )
ORDER BY 
    Branch;

--  ● Question: How many items were sold through each payment method?

SELECT 
    SUM(quantity) AS itemsSold, payment_method
FROM
    walmart_clean_data
GROUP BY payment_method;


-- What are the average, minimum, and maximum ratings for each category in each city?

SELECT 
    AVG(rating) AS average_rating,
    MIN(rating) AS minimum_rating,
    MAX(rating) AS maximum_rating,
    category,
    City 
FROM 
    walmart_clean_data 
WHERE 
    rating IS NOT NULL
GROUP BY 
    category, City;

-- Question: What is the total profit for each category, ranked from highest to lowest?

SELECT 
    category,
    SUM((unit_price * quantity) * profit_margin) AS total_profit
FROM 
    walmart_clean_data
GROUP BY 
    category
ORDER BY 
    total_profit DESC;  
-- What is the most frequently used payment method in each branch

SELECT 
    payment_method, SUM(quantity) AS itemsSold, Branch
FROM
    walmart_clean_data
GROUP BY payment_method , Branch;

--  ● Question: How many transactions occur in each shift (Morning, Afternoon, Evening)

SELECT
    SUM(CASE WHEN time >= '05:00:00' AND time < '12:00:00' THEN 1 ELSE 0 END) AS Morning,
    SUM(CASE WHEN time >= '12:00:00' AND time < '17:00:00' THEN 1 ELSE 0 END) AS Afternoon,
    SUM(CASE WHEN time >= '17:00:00' AND time < '24:00:00' THEN 1 ELSE 0 END) AS Evening,
    SUM(CASE WHEN time >= '00:00:00' AND time < '05:00:00' THEN 1 ELSE 0 END) AS Early_Morning
FROM 
    walmart_clean_data;

