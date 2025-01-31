create procedure RemoveDuplicates 
as 
begin
	begin transaction;
		with cte as
		( select Date_ID
			,row_number() over(
					partition by Branch_ID, Dealer_ID, Model_ID, Revenue, Units_sold, Date_ID, Day, Month,Year, BranchName,DealerName,Product_Name
					order by Date_ID) as rn
		from   [dbo].[cars_data] 
		)
		delete from cte
		where  rn > 1 
	commit
end








