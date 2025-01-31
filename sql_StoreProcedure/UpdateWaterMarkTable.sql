create procedure UpdateWatermakTable @last_load varchar(2000)
as
begin
	begin transaction
		update [dbo].[watermark_table] set last_load = @last_load
	commit
end