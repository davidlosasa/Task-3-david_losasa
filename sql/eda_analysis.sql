-- =====================================
-- 1. DATASET OVERVIEW (FIXED)
-- =====================================

SELECT 
    COUNT(*) AS total_transactions,
    COUNT(DISTINCT CustomerID) AS unique_customers,
    COUNT(DISTINCT Product) AS unique_products,
    SUM(TotalPrice) AS total_revenue,
    AVG(TotalPrice) AS avg_order_value
FROM sales_data;

-- =====================================
-- 2. CUSTOMER RETENTION
-- =====================================

WITH customer_orders AS (
    SELECT CustomerID, COUNT(*) AS order_count
    FROM sales_data
    GROUP BY CustomerID
)
SELECT 
    COUNT(*) AS total_customers,
    SUM(CASE WHEN order_count = 1 THEN 1 ELSE 0 END) * 1.0 / COUNT(*) AS one_time_rate,
    SUM(CASE WHEN order_count > 1 THEN 1 ELSE 0 END) * 1.0 / COUNT(*) AS repeat_rate
FROM customer_orders;

-- =====================================
-- 3. COUPON IMPACT
-- =====================================

SELECT 
    CASE 
        WHEN CouponCode IS NULL THEN 'No Coupon'
        ELSE 'Coupon Used'
    END AS coupon_usage,
    COUNT(*) AS orders,
    AVG(TotalPrice) AS avg_order_value,
    SUM(TotalPrice) AS revenue
FROM sales_data
GROUP BY 
    CASE 
        WHEN CouponCode IS NULL THEN 'No Coupon'
        ELSE 'Coupon Used'
    END;

SELECT 
    AVG(CASE WHEN CouponCode IS NULL THEN TotalPrice END) AS AOV_no_coupon,
    AVG(CASE WHEN CouponCode IS NOT NULL THEN TotalPrice END) AS AOV_coupon,
    AVG(CASE WHEN CouponCode IS NULL THEN TotalPrice END) 
    - AVG(CASE WHEN CouponCode IS NOT NULL THEN TotalPrice END) AS AOV_diff
FROM sales_data;

-- =====================================
-- 4. MARKETING PERFORMANCE
-- =====================================

SELECT 
    ReferralSource,
    COUNT(*) AS orders,
    SUM(TotalPrice) AS revenue,
    AVG(TotalPrice) AS AOV
FROM sales_data
GROUP BY ReferralSource
ORDER BY revenue DESC;



-- =====================================
-- 5. PRODUCT PERFORMANCE
-- =====================================

SELECT 
    Product,
    COUNT(*) AS orders,
    SUM(TotalPrice) AS revenue,
    AVG(TotalPrice) AS avg_order_value
FROM sales_data
GROUP BY Product
ORDER BY revenue DESC;

-- =====================================
-- 6. TEMPORAL ANALYSIS
-- =====================================

SELECT 
    FORMAT(Date, 'yyyy-MM') AS month,
    COUNT(*) AS orders,
    SUM(TotalPrice) AS revenue
FROM sales_data
GROUP BY FORMAT(Date, 'yyyy-MM')
ORDER BY month;
-- =====================================
-- 7. DELIVERY ISSUE
-- =====================================

SELECT 
    COUNT(*) AS total_orders,
    SUM(CASE WHEN TrackingNumber IS NULL THEN 1 ELSE 0 END) * 1.0 / COUNT(*) AS missing_tracking_rate
FROM sales_data;
-- =====================================
-- 8. RETURN RATE
-- =====================================

SELECT 
    OrderStatus,
    COUNT(*) AS orders,
    COUNT(*) * 1.0 / SUM(COUNT(*)) OVER() AS proportion
FROM sales_data
GROUP BY OrderStatus;


-- =====================================
-- 9. CUSTOMER VALUE
-- =====================================

SELECT 
    CustomerID,
    COUNT(*) AS orders,
    SUM(TotalPrice) AS total_spent,
    AVG(TotalPrice) AS avg_order_value
FROM sales_data
GROUP BY CustomerID;

-- =====================================
-- 10. RFM SEGMENTATION
-- =====================================

WITH rfm AS (
    SELECT 
        CustomerID,
        DATEDIFF(DAY, MAX(Date), GETDATE()) AS recency,
        COUNT(*) AS frequency,
        SUM(TotalPrice) AS monetary
    FROM sales_data
    GROUP BY CustomerID
)
SELECT 
    *,
    NTILE(5) OVER (ORDER BY recency DESC) AS R_score,
    NTILE(5) OVER (ORDER BY frequency) AS F_score,
    NTILE(5) OVER (ORDER BY monetary) AS M_score
FROM rfm;

-- =====================================
-- 11. FRAUD SIGNAL
-- =====================================

SELECT *
FROM sales_data
WHERE 
    TotalPrice > (
        SELECT AVG(TotalPrice) + 3 * STDEV(TotalPrice)
        FROM sales_data
    );


    -- =====================================
-- 12. CART ANALYSIS
-- =====================================

SELECT 
    AVG(ItemsInCart) AS avg_cart_size,
    MAX(ItemsInCart) AS max_cart_size
FROM sales_data;
