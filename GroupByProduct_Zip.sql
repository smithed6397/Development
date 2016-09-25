SELECT
cc.Product,
count(cc.Product) ProductCount,
cc."Zip Code",
avg(e.Pop_US_10K)/avg(e.pop_us) Income_10k,
avg(e.Pop_US_15K)/avg(e.pop_us) Income_15k,
avg(e.Pop_US_25K)/avg(e.pop_us) Income_25k,
avg(e.Pop_US_35K)/avg(e.pop_us) Income_35k,
avg(e.Pop_US_50K)/avg(e.pop_us) Income_50k,
avg(e.Pop_US_65K)/avg(e.pop_us) Income_65k,
avg(e.Pop_US_75K)/avg(e.pop_us) Income_75k,
avg(e.Pop_US_75K_Over)/avg(e.pop_us) Income_Over75k
FROM  Consumer_Complaints cc
join g20135us g on cc."Zip Code" = g.ZCTA5
JOIN e20135us0015000 e on e.logrecno = g.f5
WHERE length(cc.Product) > 1 
AND E.Pop_US > 0
AND E.Pop_US_10K > 0
AND E.Pop_US_15K > 0
AND E.Pop_US_25K > 0
AND E.Pop_US_35K > 0
AND E.Pop_US_50K > 0
AND E.Pop_US_65K > 0
AND E.Pop_US_75K > 0
GROUP BY cc."Zip Code", cc.Product
ORDER BY COUNT(cc.Product) DESC