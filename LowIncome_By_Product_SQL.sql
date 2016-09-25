SELECT 
cc.Product "Product Type",
count(Product) "Product Count",
cc."Zip Code",
100.0 * ROUND((avg(e.Pop_US_10K)/avg(e.pop_us)),3) "Pct Income under 10k",
100.0 * ROUND((avg(e.Pop_US_15K)/avg(e.pop_us)),3) "Pct Income under 15k",
100.0 * ROUND((avg(e.Pop_US_25K)/avg(e.pop_us)),3) "Pct Income under 25k",
100.0 * ROUND((avg(e.Pop_US_35K)/avg(e.pop_us)),3) "Pct Income under 35k",
100.0 * ROUND((avg(e.Pop_US_50K)/avg(e.pop_us)),3) "Pct Income under 50k",
100.0 * ROUND((avg(e.Pop_US_65K)/avg(e.pop_us)),3) "Pct Income under 65k",
100.0 * ROUND((avg(e.Pop_US_75K)/avg(e.pop_us)),3) "Pct Income under 75k",
100.0 * ROUND((avg(e.Pop_US_75K_Over)/avg(e.pop_us)),3) "Pct Income Over75k"
FROM  Consumer_Complaints cc
join g20135us g on cc."Zip Code" = g.ZCTA5
JOIN e20135us0015000 e on e.logrecno = g.f5 
WHERE 1=1
GROUP BY cc."Zip Code", cc.Product
HAVING count(cc.Product) > 1
AND avg(e.Pop_US_10K)/avg(e.pop_us) BETWEEN 0.0001  AND 0.9999
AND avg(e.pop_us) > 1000
ORDER BY avg(e.Pop_US_10K)/avg(e.pop_us) DESC
LIMIT 20