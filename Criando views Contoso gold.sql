------------------------------------------------
--------Criando view gold customer-------------
-----------------------------------------------

    CREATE OR ALTER VIEW gold_customer AS
    SELECT 
    CustomerKey,
    Gender,
    GivenName AS Name,
    StreetAddress AS [Address],
    City,
    State AS [State Code],
    StateFull AS [State],
    ZipCode,
    Country AS [Country Code],
	CountryFull AS [Country],
    Continent,
    Birthday,
    Age,
    Occupation,
    genero AS [Gênero],
    estado AS Estado,
    pais AS País,
    continente AS Continente,
    ocupacao AS Ocupação
    FROM silver_customer

GO
------------------------------------------------
--------Criando view gold date-----------------
-----------------------------------------------

CREATE OR ALTER VIEW gold_date AS
    SELECT 
    Date,
    Year,
    YearQuarter AS [Year Quarter],
    YearQuarterNumber AS [Year Quarter Number],
    Quarter,
    YearMonth AS [Year Month],
    YearMonthShort AS [Year Month Short],
    YearMonthNumber AS [Year Month Number],
    Month,
    MonthShort AS [Month Short],
    MonthNumber AS [Month Number],
    DayofWeek AS [Day of Week],
    DayofWeekShort AS [Day of Week Short],
    DayofWeekNumber AS [Day of Week Number],
    WorkingDay AS [Working Day],
    WorkingDayNumber AS [Working Day Number],
    ano_mes AS [Ano Mês],
    ano_mes_reduzido AS [Ano Mês Reduzido],
    mes AS [Mês],
    mes_reduzido AS [Mês Reduzido],
    dia_da_semana AS [Dia da Semana],
    dia_da_semana_reduzido AS [Dia da Semana Reduzido]
    FROM silver_date

GO
------------------------------------------------
--------Criando view gold product-----------------
-----------------------------------------------

CREATE OR ALTER VIEW gold_product AS
SELECT 
    ProductKey,
    ProductCode AS [Product Code],
    ProductName AS [Product Name],
    Manufacturer,
    Brand,
    Color,
    WeightUnit AS [Weight Unit Measure],
    Weight,
    Cost AS [Unit Cost],
    Price AS [Unit Price],
    SubCategoryKey AS [SubCategory Code],
    SubCategoryName AS SubCategory,
    CategoryKey AS [Category Code],
    CategoryName AS Category,
    nome_produto AS [Nome Produto],
    cor AS Cor,
    unidade_de_peso AS [Unidade de Peso],
    subcategoria AS Subcategoria,
    categoria AS Categoria
    FROM silver_product

GO
------------------------------------------------
--------Criando view gold store-----------------
-----------------------------------------------

CREATE OR ALTER VIEW gold_store AS
SELECT 
    StoreKey,
    StoreCode AS [Store Code],
    CountryName AS Country,
    State,
    Description AS [Name],
    SquareMeters AS [Square Meters],
    OpenDate AS [Open Date],
    CloseDate AS [Close Date],
    Status,
    nome_pais AS [País],
    estado AS [Estado],
    situacao AS [Situação]
    FROM silver_store

	GO
------------------------------------------------
--------Criando view gold sales-----------------
-----------------------------------------------

	CREATE OR ALTER VIEW gold_sales AS
	SELECT 
		[OrderKey] AS [Order Number], 
		[LineNumber] AS [Line Number], 
		[OrderDate] AS [Order Date], 
		[DeliveryDate] AS [Delivery Date], 
		[CustomerKey], 
		[StoreKey], 
		[ProductKey], 
		[Quantity], 
		[UnitPrice] AS [Unit Price], 
		[NetPrice] AS [Net Price], 
		[UnitCost] AS [Unit Cost], 
		[CurrencyCode] AS [Currency Code], 
		[ExchangeRate] AS [ExchangeRate]
		FROM silver_sales

