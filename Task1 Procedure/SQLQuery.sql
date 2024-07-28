--Q1
create proc CreateUser
(
    @Username varchar(50),
	@Email varchar(50),
	@PasswordHash varchar(50),
	@Status varchar(50),
	@AddressLine1 varchar(50),
	@AddressLine2 varchar(50),
	@City varchar(50),
	@State varchar(50),
	@PostalCode int,
	@CountryID int,
	@createdAT varchar(50)
)
As
begin
	insert into Users values(1,@Username,@Email,@PasswordHash,@Status,
	@AddressLine1,@AddressLine2,@City,@State,@PostalCode,@CountryID,@createdAT)
end
exec CreateUser @Username='Rahma',@Email='rahma.akmal@gmail',@PasswordHash='hdhdf',@Status='good'
,@AddressLine1='dam',@AddressLine2='egy',@City='damietta',@State='cairo',@PostalCode=123,@CountryID=null,
@createdAT='DAM'
--Q2
create proc UpdateUserStatus
(
	@UserID int,
	@Status varchar(20)
)
as
begin 
	update Users set users.Status =@Status where users.UserID=@UserID
end
exec UpdateUserStatus @UserID=1 , @Status='Active'
--Q3
create proc CreateItem
(
	@SellerID int, @CategoryID int, @Title varchar(50) , @Description varchar(50),
@StartingPrice decimal(18,0), @CurrentPrice decimal(18,0), @StartDate date, @EndDate date,
@ImageURL varchar(50)
)as
begin
	insert into Items(ItemID,SellerID,CategoryID,Title,Description,
	StartingPrice,CurrentPrice,StartDate,EndDate,ImageURL)
	values(1,@SellerID,@CategoryID,@Title,@Description,@StartingPrice,@CurrentPrice,@StartDate,@EndDate,@ImageURL)
end
exec CreateItem @SellerID =1,@CategoryID=null,@Title='Car',
@Description='help to transport',@StartingPrice=1000000.600,@CurrentPrice=100000.1,@StartDate='2018-2-2'
,@EndDate='2025-7-8',@ImageURL='car.jpg'
--Q4
create proc PlaceBid
(
	@ItemID int,
	@UserID int, 
	@BidAmount int
)
as
begin 
insert into bids(ItemID,UserID,BidAmount)
values (@ItemID,@UserID,@BidAmount)
update Bids set BidAmount=@BidAmount
end
exec PlaceBid @ItemID=1,@UserID=1,@BidAmount=50000
--Q6
select *  from Items i join Users u on i.SellerID=u.UserID
--Q7
select * from Users u left join Items i on u.UserID=i.SellerID
--Q8
select  * from Users u full outer join Items i on u.UserID=i.SellerID
--Q9
select i.ItemID,BidID from Items i join Bids b on i.ItemID=b.ItemID
group by i.ItemID ,b.BidID
--Q10
select u.*,o.TotalAmount from Users u join Orders o  on u.UserID=o.BuyerID
--Q11
select *,CategoryName from Items i join Categories c on i.CategoryID=c.CategoryId