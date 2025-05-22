LOAD DATA
INFILE 'ML-Dataset.csv'
INTO TABLE INVENTORY_FULL
TRUNCATE
FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"'
(
  RegionName,
  CountryName,
  State,
  City,
  PostalCode,
  WarehouseAddress,
  WarehouseName,
  EmployeeName,
  EmployeeEmail,
  EmployeePhone,
  EmployeeHireDate DATE "YYYY-MM-DD",
  EmployeeJobTitle,
  CategoryName,
  ProductName,
  ProductDescription,
  ProductStandardCost,
  Profit,
  ProductListPrice,
  CustomerName,
  CustomerAddress,
  CustomerCreditLimit,
  CustomerEmail,
  CustomerPhone,
  Status,
  OrderDate DATE "YYYY-MM-DD",
  OrderItemQuantity,
  PerUnitPrice,
  TotalItemQuantity
)

