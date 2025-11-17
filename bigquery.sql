CREATE OR REPLACE TABLE
  `rakamin-kf-analytics-478506.kimia_farma.kf_analysis_table` AS
WITH
  TabelPerhitungan AS (
  SELECT
    t1.transaction_id,
    t1.date,
    t1.branch_id,
    t2.branch_name,
    t2.kota,
    t2.provinsi,
    t2.rating AS rating_cabang,
    t1.customer_name,
    t1.product_id,
    t3.product_name,
    t1.price AS actual_price,
    t1.discount_percentage,
    
    -- 1. Hitung Nett Sales (Dibutuhkan untuk Nett Profit)
    t1.price * (1 - t1.discount_percentage) AS nett_sales_temp,
    
    -- 2. Hitung Persentase Gross Laba (Dibutuhkan untuk Nett Profit)
    CASE
      WHEN t1.price <= 50000 THEN 0.10
      WHEN t1.price > 50000 AND t1.price <= 100000 THEN 0.15
      WHEN t1.price > 100000 AND t1.price <= 300000 THEN 0.20
      WHEN t1.price > 300000 AND t1.price <= 500000 THEN 0.25
      WHEN t1.price > 500000 THEN 0.30
      ELSE 0
    END AS persentase_gross_laba_temp,
    
    t1.rating AS rating_transaksi
  FROM
    `rakamin-kf-analytics-478506.kimia_farma.kf_final_transaction` AS t1
  LEFT JOIN
    `rakamin-kf-analytics-478506.kimia_farma.kf_kantor_cabang` AS t2
    ON t1.branch_id = t2.branch_id
  LEFT JOIN
    `rakamin-kf-analytics-478506.kimia_farma.kf_product` AS t3
    ON t1.product_id = t3.product_id )
SELECT
  *,
  persentase_gross_laba_temp AS persentase_gross_laba,
  nett_sales_temp AS nett_sales,
  -- 3. Hitung Nett Profit dari hasil perhitungan sebelumnya
  nett_sales_temp * persentase_gross_laba_temp AS nett_profit
FROM
  TabelPerhitungan;