/*
=====================================================================================
Stored Procedure: Load Bronze Layer (Source -> Bronze)
=====================================================================================
Script Purpose:
    This stored procedure loads data into the 'bronze' schema from external CSV files.
    It performs the following actions:
    - Truncates the bronze tables before loading data.
    - Uses the 'BULK INSERT' command to load data from csv Files to bronze tables.

Parameters:
    None.
    This stored procedure does not accept any parameters or return any values.

Usage Example:
    EXEC bronze.load_bronze;
=====================================================================================
*/

create or alter procedure bronze.load_bronze As
begin
	declare @start_time datetime, @end_time datetime, @batch_start_time datetime, @batch_end_time datetime;
	begin try
		set @batch_start_time = getdate(); 
		print '======================================'
		print 'Loading Bronze Layer'
		print '======================================'

		print '--------------------------------------'
		print  'Loading CRM Tables'
		print '--------------------------------------'

		set @start_time = getdate();
		PRINT '>> TRUNCATING TABLE: bronze.crm_cust_info'
		Truncate table bronze.crm_cust_info;--empty the current table

		PRINT '>> INSERTING TABLE: bronze.crm_cust_info'
		BULK INSERT bronze.crm_cust_info
		FROM 'C:\Users\barin\Desktop\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		set @end_time = getdate();
		print '>> load duration: ' + cast(dateDIFF(second, @start_time, @end_time)as nvarchar) + 'seconds';
		
		set @start_time = getdate();
		PRINT '>> TRUNCATING TABLE: bronze.crm_prd_info'
		Truncate table bronze.crm_prd_info;--empty the current table

		PRINT '>> INSERTING TABLE: bronze.crm_prd_info'
		BULK INSERT bronze.crm_prd_info
		FROM 'C:\Users\barin\Desktop\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		set @end_time = getdate();
		print '>> load duration: ' + cast(dateDIFF(second, @start_time, @end_time)as nvarchar) + 'seconds';
		

		set @start_time = getdate();
		PRINT '>> TRUNCATING TABLE: bronze.crm_sales_details'
		Truncate table bronze.crm_sales_details;--empty the current table
		PRINT '>> INSERTING TABLE: bronze.crm_sales_details'
		BULK INSERT bronze.crm_sales_details
		FROM 'C:\Users\barin\Desktop\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		set @end_time = getdate();
		print '>> load duration: ' + cast(dateDIFF(second, @start_time, @end_time)as nvarchar) + 'seconds';

		print '--------------------------------------'
		print  ' Loading ERP Tables'
		print '--------------------------------------'


		set @start_time = getdate();
		PRINT '>> TRUNCATING TABLE: bronze.erp_loc_a101'
		Truncate table bronze.erp_loc_a101;--empty the current table
		PRINT '>> INSERTING TABLE: bronze.erp_loc_a101'
		BULK INSERT bronze.erp_loc_a101
		FROM 'C:\Users\barin\Desktop\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\loc_a101.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		set @end_time = getdate();
		print '>> load duration: ' + cast(dateDIFF(second, @start_time, @end_time)as nvarchar) + 'seconds';

		set @start_time = getdate();
		PRINT '>> TRUNCATING TABLE: bronze.erp_cust_az12'
		Truncate table bronze.erp_cust_az12;--empty the current table
		PRINT '>> INSERTING TABLE: bronze.erp_cust_az12'
		BULK INSERT bronze.erp_cust_az12
		FROM 'C:\Users\barin\Desktop\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\cust_az12.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		set @end_time = getdate();
		print '>> load duration: ' + cast(dateDIFF(second, @start_time, @end_time)as nvarchar) + 'seconds';

		set @start_time = getdate();
		PRINT '>> TRUNCATING TABLE: bronze.erp_px_cat_g1v2'
		Truncate table bronze.erp_px_cat_g1v2;--empty the current table
		PRINT '>> INSERTING TABLE: bronze.erp_px_cat_g1v2'
		BULK INSERT bronze.erp_px_cat_g1v2
		FROM 'C:\Users\barin\Desktop\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\px_cat_g1v2.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		set @end_time = getdate();
		print '>> load duration: ' + cast(dateDIFF(second, @start_time, @end_time)as nvarchar) + 'seconds';
		print '>> ------------------------'

		set @batch_end_time = getdate();
		print '==========================================='
		print 'loading bronze layer is completd';
		print '      - Total load Duration: ' + cast(datediff(second, @batch_start_time, @batch_end_time)as nvarchar) + 'seconds';
		print '==========================================='
	
	end try
	begin catch
		print '==========================================='
		print 'error occured during loading bronze layer'
		print 'Error message' + Error_message();
		print 'Error number' + cast(Error_number() as nvarchar);
		print 'Error message' + cast(Error_state() as nvarchar);
		print '==========================================='
	end catch
end
