

declare @startDate date;
declare @endDate date;
declare @roomTypeId int;

set @startDate = '2023/01/22';
set @endDate = '2023/01/28';
set @roomTypeId = 3;


select r.*
from dbo.Rooms r
inner join dbo.RoomTypes t on t.Id = r.RoomTypeId
where r.RoomTypeId = @roomTypeId
and r.Id not in (
select b.RoomId
from dbo.Bookings b
where (@startDate < b.StartDate and @endDate > b.EndDate)
	or (@startDate <= b.StartDate and @endDate > b.StartDate)
	or (@startDate < b.EndDate and @endDate >= b.EndDate)

);
