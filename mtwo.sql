create database mtwo;
create database m3 ;
use mtwo;
use m2;
use m3;
drop database mtwo;
	
	--2.1 a 
	GO;
	CREATE PROCEDURE createAllTables 
	AS
		
		create table SystemUser(
		username varchar(20) primary key,
		password varchar(20)
		);

		create table System_Admin(
		id int identity,
		username varchar(20),
		name varchar(20),
		constraint pk_system_admin primary key(id),
		constraint fk_system_admin foreign key (username) references SystemUser (username)
		);

		create table Club(
		id int primary key identity,
		name varchar(20),
		location varchar(20)
		);

		create table Club_Representative(
		id int identity,
		username varchar(20),
		name varchar(20),
		club_id int,
		constraint pk_club_representative primary key(id),
		constraint fk_club_representative1 foreign key (username) references SystemUser (username),
		constraint fk_club_representative2 foreign key (club_id) references Club (id)       
		);

		create table Stadium(
		id int primary key identity,
		name varchar(20),
		location varchar(20),
		capacity int,
		status bit
		);

		create table Stadium_Manager(
		id int identity,
		username varchar(20),
		name varchar(20),
		stadium_id int,
		constraint pk_stadium_manager primary key(id),
		constraint fk_stadium_manager1 foreign key (username) references SystemUser (username), 
		constraint fk_stadium_manager2 foreign key (stadium_id) references Stadium (id)  
		);

		create table Sports_Association_Manager(
		id int identity,
		username varchar(20),
		name varchar(20),
		constraint pk_sports_association_manager primary key(id),
		constraint fk_sports_association_manager foreign key (username) references SystemUser (username)
		);

		create table Match ( 
		id int primary key identity,
		hostID int,
		guestID int,
		start_time datetime,
		end_time datetime,
		stadium_id int,
		constraint fk_match1 foreign key(hostID) references Club (id),        
		constraint fk_match2 foreign key(guestID) references Club (id),       
		constraint fk_match3 foreign key(stadium_id) references Stadium (id) 
		);

		create table Host_Request(
		id int primary key identity,
		stadium_manager_id int,
		club_representative_id int,
		match_id int,
		status varchar(20),
		constraint fk_host_request1 foreign key (stadium_manager_id) references Stadium_Manager (id),                     
		constraint fk_host_request3 foreign key (club_representative_id) references Club_Representative (id),       
		constraint fk_host_request5 foreign key (match_id) references Match (id)                                  
		);
		
		create table Fan(
		national_id varchar(20),
		username varchar(20),
		name varchar(20),
		birth_date date,
		phone_number varchar(20),
		address varchar(20),		
		status bit,
		constraint pk_fan primary key(national_id),
		constraint fk_fan foreign key(username) references SystemUser (username)
		);

		create table Ticket(
		id int primary key identity,		
		fan_national_id varchar(20),
		match_id int,
		status bit,
		constraint fk_ticket1 foreign key(fan_national_id) references Fan (national_id),     
	    constraint fk_ticket3 foreign key(match_id) references Match (id)       
		);
	go
	exec createAllTables;

	--2.1 b
	go;
	
	CREATE PROCEDURE dropAllTables
	AS
	exec sys.sp_msforeachtable 'alter table? nocheck constraint all'
	drop table Ticket;
	drop table Fan;
	drop table Host_Request;
	drop table Match;
	drop table Sports_Association_Manager;
	drop table Stadium_Manager;
	drop table Stadium;
	drop table Club_Representative;
	drop table Club
	drop table System_Admin;
	drop table SystemUser;
	EXEC dropAllTables

	--2.1 c 
	go;
	CREATE PROCEDURE dropAllProceduresFunctionsViews
	AS
	--2.1
	drop procedure createAllTables;
	drop procedure dropAllTables;
	drop procedure clearAllTables;
	--2.2
	drop view allAssocManagers;
	drop view allClubRepresentatives;
	drop view allStadiumManagers;
	drop function IsBlocked;
	drop view allFans;
	drop view allMatches;
	drop view allTickets;
	drop view allClubs;
	drop function IsAvailable;
	drop view allStadiums;
	drop view allRequests;
	--2.3
	drop procedure addAssociationManager;
	drop procedure addNewMatch;
	drop view clubsWithNoMatches;
	drop procedure deleteMatch;
	drop procedure deleteMatchesOnStadium;
	drop procedure addClub;
	drop procedure addTicket;
	drop procedure deleteClub;
	drop procedure addStadium;
	drop procedure deleteStadium;
	drop procedure blockFan;
	drop procedure unblockFan;
	drop procedure addRepresentative;
	drop function viewAvailableStadiumsOn;
	drop procedure addHostRequest;
	drop function allUnassignedMatches;
	drop procedure addStadiumManager;
	drop procedure allPendingRequests;
	drop procedure acceptRequest;
	drop procedure rejectRequest;
	drop procedure addFan;
	drop function upcomingMatchesOfClub;
	drop function availableMatchesToAttend;
	drop procedure purchaseTicket;
	drop procedure updateMatchHost;
	drop view matchesPerTeam;
	drop view clubsNeverMatched;
	drop function clubsNeverPlayed;
	drop function matchWithHighestAttendance;
	drop function matchesRankedByAttendance;
	drop function requestsFromClub;


	--2.1 d
	GO;
	CREATE PROCEDURE clearAllTables
	AS
	truncate table SystemUser;
	truncate table Stadium_Manager;
	truncate table Club_Representative;
	truncate table Sports_Association_Manager;
	truncate table System_Admin;
	truncate table Fan;
	truncate table Host_Request;
	truncate table Stadium;
	truncate table Club
	truncate table Match;
	truncate table Ticket;


	--2.2 a 
	GO;
	CREATE VIEW allAssocManagers
	AS
	select sam.username as 'association_manager_username', su.password as 'association_manager_password', sam.name as 'association_manager_name'
	from Sports_Association_Manager sam inner join SystemUser su on su.username = sam.username;

	go;
	select * from allAssocManagers;

	--2.2 b
	GO;
	CREATE VIEW allClubRepresentatives
	AS
	select cr.username as 'club_representative_username', su.password as 'club_representative_password', cr.name as 'club_representative_name', c.name as 'club_name'  
	from Club_Representative cr inner join SystemUser su on su.username = cr.username 
	inner join Club c on c.id = cr.club_id; 
	
	go;
	select * from allClubRepresentatives;

	--2.2 c
	GO;
	CREATE VIEW allStadiumManagers
	AS
	select sm.username as 'stadium_manager_username', su.password as 'stadium_manager_password', sm.name as 'stadium_manager_name', s.name as 'stadium_name'  
	from Stadium_Manager sm inner join SystemUser su on su.username = sm.username
	inner join Stadium s on s.id= sm.stadium_id;

	go;
	select * from allStadiumManagers;

	--2.2 d
	GO;
	CREATE FUNCTION IsBlocked
	(@A bit)
	RETURNS varchar(10)
	AS BEGIN
	DECLARE @B varchar(10)
	IF @A=0
	SET @B='blocked'
	ELSE SET @B='unblocked'
	RETURN @B
	END;
	
	GO;
	CREATE VIEW allFans
	AS
	select f.national_id as 'fan_national_id',f.username as 'fan_username', f.name as 'fan_name',su.password as 'fan_password', f.birth_date as 'fan_birth_date' , dbo.IsBlocked(status) as 'fan_status'
	from Fan f inner join SystemUser su on su.username = f.username;
	
	go;
	select * from allFans;
	

	--2.2 e
	GO;
	CREATE VIEW allMatches
	AS 
	select c.name as 'host_name', c1.name as 'guest_name', m.start_time as 'start_time' , m.end_time as 'end_time'
	from Match m
	inner join Club c on c.id = m.hostID
	inner join Club c1 on c1.id = m.guestID;
	
	go;
	select * from allMatches;

	--2.2 f
	GO;
	CREATE VIEW allTickets 
	AS
	select c.name as 'host_name', c1.name as 'guest_name', s.name as 'stadium_name', m.start_time as 'start_time'
	from match m 
	inner join Club c on c.id = m.hostID
	inner join Club c1 on c1.id = m.guestID
	inner join Stadium s on m.stadium_id=s.id;
	
	go;
	select * from allTickets;

	--2.2 g
	GO;
	CREATE VIEW allClubs 
	AS
	select c.name as 'club_name', c.location as 'club_location'
	from club c;
	
	go;
	select * from allClubs;

	--2.2 h
	GO;	
	CREATE FUNCTION IsAvailable
	(@X bit)
	RETURNS varchar(10)
	AS BEGIN
	DECLARE @Y varchar(10)
	IF @X=0
	SET @Y='Unavailable'
	ELSE 
	SET @Y='Available'
	RETURN @Y
	END;
	
	GO;
	CREATE VIEW allStadiums
	AS
	select name as 'stadium_name', location as 'stadium_location',capacity as 'stadium_capacity', dbo.IsAvailable(status) as 'stadium_status'
	from stadium;

	go;
	select * from allStadiums;
	
	--2.2 i
	GO;
	CREATE VIEW allRequests 
	AS
	select cr.username as 'club_represntative_username', sm.username as 'stadium_manager_username', hr.status as 'request_status'
	from Stadium_Manager sm 
	inner join  Host_Request hr on sm.id = hr.stadium_manager_id
	inner join Club_Representative cr on cr.id = hr.club_representative_id;

	go;
	select * from allRequests;

	--2.3 
	--i
	go;
	create procedure addAssociationManager
	@association_manager_name varchar(20),
	@association_manager_username varchar(20),
	@association_manager_password varchar(20)
	as

	insert into SystemUser(username,password)
	values (@association_manager_username,@association_manager_password);

	insert into Sports_Association_Manager(username,name) 
	values (@association_manager_username,@association_manager_name);

	
	exec addAssociationManager 'shobeer','ahmed','sara123';
	exec addAssociationManager 'treka','mohamed','malak123';
	exec addAssociationManager 'owayran','saeed','ahmed123';
	select * from Sports_Association_Manager;
	

	--ii
	go;
	create procedure addNewMatch
	@host_name varchar(20),
	@guest_name varchar(20),
	@start_time datetime,
	@end_time datetime
	as

	declare @host_id int;
	declare @guest_id int;

	select @host_id = id
	from Club
	where name = @host_name;

	select @guest_id = id
	from Club
	where name = @guest_name;

	insert into Match (hostID,guestID,start_time,end_time)
	values (@host_id,@guest_id,@start_time,@end_time);

	
	

	--iii
	go;
	create view clubsWithNoMatches
	as

	select c.name
	from Club c inner join Match m on (c.id <> m.hostID) and (c.id <> m.guestID) --kind of makes sense en c.id <> m.hostID and c.id <> m.guestID, dk tho. tried it as = , didnt output anything
	where m.id is null;

	go;
	select * from clubsWithNoMatches;

	--iv
	go;
	create procedure deleteMatch
	@host_name varchar(20),
	@guest_name varchar(20),
	@starttime DATETIME,
    @endtime DATETIME
	as

	declare @host_id int;
	declare @guest_id int;

	select @host_id = id
	from Club
	where name = @host_name;

	select @guest_id = id
	from Club
	where name = @guest_name;

	delete from Match
	where (hostID = @host_id) and (guestID = @guest_id) and (start_time=@starttime) and (end_time=@endtime);
	
	--exec deleteMatch 'Bayern Munich','Chelsea';


	--v
	go;
	create procedure deleteMatchesOnStadium
	@stadium_name varchar(20)
	as

	declare @stadium_id int;

	select @stadium_id = id
	from Stadium
	where name = @stadium_name;

	delete from Match
	where (stadium_id = @stadium_id) and (end_time > current_timestamp); 

	exec deleteMatchesOnStadium 'Allianz arena';

	--vi
	go;
	create procedure addClub
	@club_name varchar(20),
	@club_location varchar(20)
	as

	insert into Club (name,location)
	values(@club_name,@club_location);

	



	--vii
	go
	create procedure addTicket
	@host_name varchar(20),
	@guest_name varchar(20),
	@start_time datetime
	as

	declare @host_id int;
	declare @guest_id int;
	declare @match_id int;

	select @host_id = id
	from Club
	where name = @host_name;

	select @guest_id = id
	from Club
	where name = @guest_name;

	select @match_id = id
	from Match
	where (start_time = @start_time) and (hostID = @host_id) and (guestID = @guest_id);

	insert into Ticket (match_id) 
	values(@match_id);

	
	

	--viii
	go
	create procedure deleteClub
	@club_name varchar(20)
	as

	
	if @club_name NOT IN ( select C.name From Club C)
	begin
	print 'CLUB NOT FOUND'
	end
	else
	begin 
	delete from club
	where name = @club_name
	end

	exec deleteClub 'Liverpool';
	select * from allClubs;

	--ix
	go
	create procedure addStadium
	@stadium_name varchar(20),
	@location varchar(20),
	@capacity int 
	as 

	insert into Stadium (name,location,capacity)
	values(@stadium_name,@location,@capacity);

	
	--x
	go;
	create procedure deleteStadium
	@stadium_name varchar(20)
	as
	begin
	delete from Stadium
	where name = @stadium_name;
	end;
	go;


	declare @StadiumID int 
	select @StadiumID  = id from Stadium where name = @stadium_name
	
	update Match set stadium_id = null where stadium_id = @StadiumID
	

	exec deleteStadium 'Cairo Stadium';
	select * from allStadiums;


	--xi
	go;
	create procedure blockFan 
	@national_id varchar(20)
	as

	update Fan
	set status = '0'
	where national_id = @national_id;

	exec blockFan '874690652';
	select * from allFans;

	--xii
	go;
	create procedure unblockFan 
	@national_id varchar(20)
	as

	update Fan
	set status = '1'
	where national_id = @national_id;

	exec unblockFan '874690652';
	select * from allFans;

	--xiii
	go;
	create procedure addRepresentative
	@club_representative_name varchar(20),
	@club_name varchar(20),
	@club_representative_username varchar(20),
	@club_representative_password varchar(20)
	as

	declare @club_id int;

	select @club_id = id
	from Club
	where name = @club_name;

	insert into SystemUser(username,password)
	values (@club_representative_username,@club_representative_password);

	insert into Club_Representative (username,name,club_id) 
	values(@club_representative_username,@club_representative_name,@club_id);

	


	--xiv
	go;
	create function viewAvailableStadiumsOn
	(@date datetime)
	returns @Available_Stadiums table (stadium_name varchar(20),stadium_location varchar(20),stadium_capacity int)
	as
	begin

	insert into @Available_Stadiums
	select s.name,s.location,s.capacity
	from Stadium s 
	where s.status = 1 

	return
	end;

	go;
	select * from dbo.viewAvailableStadiumsOn ('2022/12/10 9:45:00');

	--xv
	go;
	create procedure addHostRequest
	@club_name varchar(20),
	@stadium_name varchar(20),
	@start_time datetime 
	as

	declare @clubrep_id int;
	declare @stadium_manager_id int;
	declare @match_id int;

	select @clubrep_id = cr.id
	from Club_Representative cr inner join Club c on c.id = cr.club_id
	where c.name = @club_name;

	select @stadium_manager_id = sm.id
	from Stadium_Manager sm inner join Stadium s on s.id = sm.stadium_id
	where s.name = @stadium_name;

	select @match_id = id
	from Match 
	where (start_time = @start_time);

	insert into Host_Request(stadium_manager_id,club_representative_id,match_id)
	values(@stadium_manager_id,@clubrep_id,@match_id);
	 
	

	--xvi
	go;
	create function allUnassignedMatches
	(@host_name varchar(20))
	returns @Unassigned_Matches table (guest_club varchar(20),match_start_time datetime)
	as
	begin

	insert into @Unassigned_Matches
	select c2.name ,m.start_time
	from Club c1 inner join Match m on c1.id = m.hostID
	inner join Club c2 on c2.id = m.guestID
	where c1.name = @host_name and m.stadium_id is null

	return
	end;

	go;
	select * from dbo.allUnassignedMatches ('Chelsea');
	

	--xvii
	go;
	create procedure addStadiumManager
	@stadium_manager_name varchar(20),
	@stadium_name varchar(20),
	@stadium_manager_username varchar(20),
	@stadium_manager_password varchar(20)
	as

	declare @stadium_id int;

	select @stadium_id = id
	from Stadium
	where name = @stadium_name;

	insert into SystemUser(username,password)
	values (@stadium_manager_username,@stadium_manager_password);

	insert into Stadium_Manager(username,name,stadium_id)
	values (@stadium_manager_username,@stadium_manager_name,@stadium_id); 
	
	
	
	--xviii
	go;
	create function allPendingRequests
	(@stadium_manager_username varchar(20))
	returns @Pending_Requests table (club_representative_name varchar(20),guest_club varchar(20),match_start_time datetime)
	as
	begin

	insert into @Pending_Requests
	select cr.name,c2.name,m.start_time
	from Stadium_Manager sm inner join Host_Request h on sm.id = h.stadium_manager_id 
	inner join Club_Representative cr on cr.id = h.club_representative_id
	inner join Stadium s on s.id = sm.stadium_id 
	inner join Match m on s.id = m.stadium_id 
	inner join Club c1 on c1.id = m.hostID
	inner join Club c2 on c2.id = m.guestID
	where h.status = 'Unhandled' and sm.username = @stadium_manager_username and cr.club_id = c1.id

	return 
	end;

	go;
	select * from dbo.allPendingRequests('karim.gamaleldin');
	select * from Host_Request;

	--xix
	go;
	create procedure acceptRequest
	@stadium_manager_username varchar(20),
	@host_name varchar(20),
	@guest_name varchar(20),
	@start_time datetime
	as 

	declare @host_id int;
	declare @guest_id int;
	declare @match_id int;
	declare @stadium_id int;
	declare @stadium_manager_id int;
	declare @capacity int;

	select @host_id = id
	from Club
	where name = @host_name;

	select @guest_id = id
	from Club
	where name = @guest_name;

	select @match_id = id
	from Match
	where (start_time = @start_time) and (hostID = @host_id) and (guestID = @guest_id);

	select @stadium_id = stadium_id 
	from Stadium_Manager 
	where username = @stadium_manager_username;

	select @stadium_manager_id = id 
	from Stadium_Manager 
	where username = @stadium_manager_username;

	select @capacity = capacity
	from Stadium
	where id = @stadium_id;

	declare @counter int;
	set @counter = 0;
	while @counter < @capacity 
	begin
	exec addTicket @host_name,@guest_name,@start_time
	end;


	update Host_Request
	set status = 'Accepted'
	where stadium_manager_id = @stadium_manager_id;

	update Match 
	set stadium_id = @stadium_id
	where id = @match_id;

	exec acceptRequest 'karim.gamaleldin','Bayern Munich','Chelsea','2022/10/10 9:45:00';

	select * from allRequests;


	--xx
	go;
	create procedure rejectRequest
	@stadium_manager_username varchar(20),
	@host_name varchar(20),
	@guest_name varchar(20),
	@start_time datetime
	as 

	declare @host_id int;
	declare @guest_id int;
	declare @match_id int;
	declare @stadium_manager_id int

	select @host_id = id
	from Club
	where name = @host_name;

	select @guest_id = id
	from Club
	where name = @guest_name;

	select @stadium_manager_id = id 
	from Stadium_Manager 
	where username = @stadium_manager_username;

	select @match_id = id
	from Match
	where (start_time = @start_time) and (hostID = @host_id) and (guestID = @guest_id);

	update Host_Request
	set status = 'Rejected'
	where stadium_manager_id = @stadium_manager_id;

	exec rejectRequest 'karim.gamaleldin','Bayern Munich','Chelsea','2022/10/10 9:45:00';

	select * from allRequests;
	

	--xxi
	go;
	
	create procedure addFan
	@fan_name varchar(20),
	@fan_username varchar(20),
	@fan_password varchar(20),
	@fan_national_id varchar(20),
	@fan_birth_date datetime,
	@fan_address varchar(20),
	@fan_phone_number varchar(20)
	as

	insert into SystemUser(username,password)
	values (@fan_username,@fan_password);

	insert into Fan (national_id,username,name,birth_date,phone_number,address)
	values(@fan_national_id,@fan_username,@fan_name,@fan_birth_date,@fan_phone_number,@fan_address);

	

	--xxii
	go;
	create function upcomingMatchesOfClub
	(@host_name varchar(20))
	returns @Upcoming_Matches table (club_name varchar(20),guest_club varchar(20),match_start_time datetime, stadium_name varchar(20))
	as
	begin

	insert into @Upcoming_Matches
	select c1.name,c2.name,m.start_time,s.name
	from Stadium s inner join Match m on s.id = m.stadium_id
	inner join Club c1 on c1.id = m.hostID
	inner join Club c2 on c2.id = m.guestID
	where c1.name = @host_name and m.end_time > current_timestamp

	return 
	end;

	--xxiii
	go;
	create function availableMatchesToAttend
	(@date datetime)
	returns @Available_Matches_To_Attend table (club_name varchar(20),guest_club varchar(20),match_start_time datetime, stadium_name varchar(20))
	as
	begin

	insert into @Available_Matches_To_Attend
	select c1.name,c2.name,m.start_time,s.name
	from Stadium s inner join Match m on s.id = m.stadium_id
	inner join Club c1 on c1.id = m.hostID
	inner join Club c2 on c2.id = m.guestID
	inner join Ticket t on m.id = t.match_id
	where m.start_time > = @date and t.status = '1'

	return
	end;
	

	--xxiv
	go;
	create procedure purchaseTicket
	@fan_national_id varchar(20),
	@host_name varchar(20),
	@guest_name varchar(20),
	@start_time datetime
	as

	declare @host_id int;
	declare @guest_id int;
	declare @match_id int;

	select @host_id = id
	from Club
	where name = @host_name;

	select @guest_id = id
	from Club
	where name = @guest_name;

	select @match_id = id
	from Match
	where (start_time = @start_time) and (hostID = @host_id) and (guestID = @guest_id);

	declare @status bit
	select @status = status from Fan where national_id = @fan_national_id

	if(@status = 1)
	begin
		update Ticket
		set status = '0', fan_national_id = @fan_national_id
		where  (match_id = @match_id) and (status = '1');
	end
	else
		print('You are blocked, Cannot purchase')
	
	exec purchaseTicket '874690652', 'Bayern Munich','Chelsea','2022/10/10 9:45:00';
	
	--xxv
	go;
	create procedure updateMatchHost
	@host_name varchar(20),
	@guest_name varchar(20),
	@start_time datetime
	as

	declare @host_id int;
	declare @guest_id int;
	declare @match_id int;

	select @host_id = id
	from Club
	where name = @host_name;

	select @guest_id = id
	from Club
	where name = @guest_name;

	select @match_id = id
	from Match
	where (start_time = @start_time) and (hostID = @host_id) and (guestID = @guest_id);

	update Match
	set @guest_id = @host_id, @guest_name = @host_name
	where id = @match_id;

	exec updateMatchHost 'Bayern Munich','Chelsea','2022/10/10 9:45:00';
	select * from  allMatches;

	--xxvi
	go;
	create view matchesPerTeam 
	as
	select c.name as 'club_name', count(m.id) as 'matches_played'
	from Club c inner join Match m on ((c.id = m.hostID) or (c.id =m.guestID))
	where m.end_time < = current_timestamp
	Group by c.name;

	
	--xxvii
	go;
	CREATE VIEW clubsNeverMatched
	AS 
	SELECT c.name AS ClubOne, l.name AS ClubTwo
	FROM Club c ,Club l
	WHERE c.id>l.id and NOT EXISTS(
	SELECT u.id,b.id
	from Club u inner join Match m1 on(u.id =m1.guestID or u.id=m1.hostID) inner join Club b on(m1.guestID=b.id or m1.hostID=b.id)
	where u.id= c.id and b.id=l.id)
	go;

	--xxviii	
	GO;;
	CREATE FUNCTION clubsNeverPlayed
	(@Club varchar(20))
	returns @NeverPlayed table(name varchar(20))
	AS
	BEGIN
	INSERT INTO @NeverPlayed 
	SELECT c4.name 
	FROM Club c4
	WHERE c4.name<>@Club
	EXCEPT 
	(SELECT c1.name
		FROM Club c inner join match m on m.hostID= c.ID
		inner join Club c1 on c1.ID=m.guestID
		where c.name=@Club)
	UNION
	(Select c3.name
		FROM Club c2 inner join match m on m.guestID=c2.ID
		inner join Club c3 on c3.ID= m.hostID
		where c2.name=@Club)
	return;
	end;


	--xxix
	GO;
	CREATE FUNCTION matchWithHighestAttendance
	()
	returns @Highest table(HostClub varchar(20), GuestClub varchar(20))
	AS 
	BEGIN
	INSERT INTO @Highest
	SELECT  c1.name, c2.name
	FROM Club c1 inner join Match m on c1.id = m.hostID
	inner join Club c2 on c2.id = m.guestID
	inner join Ticket t on m.id = t.match_id
	GROUP BY c1.name, c2.name
	HAVING count(t.id) > ALL (SELECT count(t2.id)
								FROM Ticket t2 inner join Match m2 on m2.id = t2.match_id);
	Return;
	END;


	--xxx
	GO;
	create function matchesRankedByAttendance
	()
	returns @Matches_Ranked table (host_club varchar(20),guest_club varchar(20))
	as
	begin
	insert into @Matches_Ranked
	select c1.name,c2.name
	from Club c1 inner join Match m on c1.id = m.hostID
	inner join Club c2 on c2.id = m.guestID
	inner join Ticket t on m.id = t.id
	where m.end_time < =  current_timestamp and t.status = '0'
	group by c1.name,c2.name
	order by count(t.id) desc

	return
	end;


	--xxxi
	GO;
	
	CREATE FUNCTION requestsFromClub
	(@ClubName varchar(20) , @Stadium varchar(20))
	returns @RequestInfo table
	(Host varchar(20), Guest varchar(20))
	AS
	BEGIN
	DECLARE @HostClub varchar(20)
	DECLARE @GuestID int
	DECLARE @HostID int;
	DECLARE @ClubID int;
	DECLARE @ClubRepID int;
	DECLARE @MatchID int;
	DECLARE @GuestClub varchar(20);

	(SELECT @ClubID = c.id
	from Club c
	where c.name=@ClubName)
	
	
	(SELECT @ClubRepID = cr.id
	from Club_Representative cr
	where cr.club_id= @ClubID)

	
	(SELECT @MatchID=m.id
	from Stadium s inner join Match m on s.id = m.id
	where s.name = @Stadium)

	
	(SELECT @GuestClub=c.name
	from Club c
	where c.id=@GuestID)

	
	(SELECT @HostClub=c.name
	from Club c
	where c.id=@HostID)
	
	
	(SELECT @GuestID = m.guestID,@HostID = m.hostID
	from Host_Request hr , match m
	where hr.club_representative_id= @ClubRepID and hr.match_id = @MatchID)
	insert into @RequestInfo values(@HostClub,@GuestClub)
	RETURN
	END;

	GO;

insert into SystemUser (username,password) values('sara.amr','sara123')
insert into SystemUser (username,password)values('malak.amer','malak123')
insert into SystemUser (username,password)values('ahmed.amer','ahmed123')

insert into Fan (national_id,username,phone_number,name,address,status,birth_date)values (812,'sara.amr',01021112055,'sara','7daye2',0,'01/05/2002')
insert into Fan (national_id,username,phone_number,name,address,status,birth_date)values (3428,'malak.amer',01000981553,'malak','nargis3',0,'8/12/2002')
insert into Fan (national_id,username,phone_number,name,address,status,birth_date)values (3434,'ahmed.amer',01021112055,'ahmed','nargis3',1,'8/12/2002')


insert into Stadium (name,status,location,capacity)values('Camp nou',1, 'Barcelona',80000)
insert into Stadium(name,status,location,capacity) values('Stamford bridge',1, 'London',45000)
insert into Stadium (name,status,location,capacity)values('Allianz arena',0, 'Munich',70000)

insert into Club(name,location) values( 'Chelsea','London')
insert into Club(name,location) values( 'Bayern Munich','Munich')
insert into Club (name,location)values( 'Barcelona','Barcelona')

insert into SystemUser (username,password)values('shobeer','sara123')
insert into SystemUser (username,password)values('treka','malak123')
insert into SystemUser (username,password)values('owayran','ahmed123')

INSERT INTO Sports_Association_Manager (username,name)VALUES ('shobeer','ahmed')
INSERT INTO Sports_Association_Manager (username,name)VALUES ('treka','mohamed')
INSERT INTO Sports_Association_Manager(username,name) VALUES ('owayran','saeed')

insert into SystemUser (username,password)values('haleem','haleem123')
insert into SystemUser (username,password)values('hamza','hamza123')
insert into SystemUser (username,password)values('hend','hend123')



INSERT INTO System_Admin (username,name)VALUES('haleem','omar')
INSERT INTO System_Admin (username,name)VALUES('hamza','aly')
INSERT INTO System_Admin (username,name)VALUES('hend','henda')

insert into SystemUser (username,password)values('omar.ashraf','omar123')
insert into SystemUser (username,password)values('ali.3agamy','ali123')
insert into SystemUser(username,password) values('karim.gamaleldin','123')

insert into Stadium_Manager (username,name,stadium_id)values('omar.ashraf','omar',1)
insert into Stadium_Manager(username,name,stadium_id) values('ali.3agamy','ali',2)
insert into Stadium_Manager(username,name,stadium_id) values('karim.gamaleldin','Karim',3)

insert into SystemUser (username,password)values('mostafa.elkout','mostafa123')
insert into SystemUser (username,password)values('mirna.haitham','mirna123')
insert into SystemUser (username,password)values('pep.guardiola','pep123')

insert into Club_Representative (username,name,club_id)values('mostafa.elkout','mostafa',2)
insert into Club_Representative (username,name,club_id)values('mirna.haitham','mirna',1)
insert into Club_Representative (username,name,club_id)values('pep.guardiola','pep',3)

insert into Match (start_time,end_time,hostID,guestID,stadium_id)values('2022/10/10 9:45:00','2022/10/10 11:00:00',2,1,2)
insert into Match (start_time,end_time,hostID,guestID,stadium_id)values('2022/11/20 7:45:00','2022/11/20 9:00:00',1,3,2)
insert into Match (start_time,end_time,hostID,guestID,stadium_id)values('2022/9/11 8:00:00','2022/9/11 11:00:00',3,2,1)

insert into Ticket(status,fan_national_id,match_id) values(1,3434,1)
insert into Ticket (status,fan_national_id,match_id)values(0,3428,2)
insert into Ticket (status,fan_national_id,match_id)values(1,812,3)

insert into Host_Request (status,stadium_manager_id,club_representative_id,match_id)values (1,1,2,2) 
insert into Host_Request(status,stadium_manager_id,club_representative_id,match_id) values (0,2,1,3)
insert into Host_Request (status,stadium_manager_id,club_representative_id,match_id)values (1,3,3,1)

Go;
create proc userLogin
@username varchar(25),
@password varchar(25),
@success bit output,
@type varchar(20) output
AS 
Begin
if exists( select username,password from SystemUser where username=@username and password=@password)
begin 
set @success=1
if exists( select username from Club_Representative where username=@username)
set @type='Club Representative'
if exists( select username from Sports_Association_Manager where username=@username)
set @type='Sports Manager'
if exists( select username from System_Admin where username=@username)
set @type='System Admin'
if exists( select username from Stadium_Manager where username=@username)
set @type='Stadium Manager'
if exists( select username from Fan where username=@username)
set @type='Fan'
end
else
begin
set @success=0
end
end
go;

CREATE VIEW UpcomingMatches
AS
SELECT  ch.name AS 'HOST', cg.name AS 'GUEST',m.start_time, m.end_time
FROM Club ch,MATCH m,Club cg 
WHERE (Cast(m.start_time AS DATE) >  CURRENT_TIMESTAMP)and ch.id= m.hostID and cg.id=m.guestID
go

CREATE VIEW AlreadyPlayedMatches
AS
SELECT  ch.name AS 'HOST', cg.name AS 'GUEST', m.start_time, m.end_time
FROM Club ch ,Match m ,Club cg 

WHERE (Cast(m.start_time AS DATE) < CURRENT_TIMESTAMP)and ch.id= m.hostID and cg.id=m.guestID


go




select * from Match
select * from club
select * from allTickets





