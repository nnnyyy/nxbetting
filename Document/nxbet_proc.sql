#계정추가
delimiter //
create procedure account_add
(in 
emailid_in varchar(32), #로그인id
username_in varchar(32) #닉네임
)

begin
	#BEGIN
    select @emailid_out := emailid from account where emailid = emailid_in;
    select @username_out := username from account where username = username_in;
    
    if (@emailid_out = emailid_in or @username_out= username_in) then
    
	select '같은 이메일ID이거나 같은 닉네임 입니다' as comment;
	
    else 
    
    insert into account (emailid,username,regdate) values (emailid_in, username_in, now());

	select @accountid_into := accountid from account where emailid = emailid_in;
    insert into Account_Assets (accountid,assets) values (@accountid_into, 0);
    
    
    end if;
	#END;

end
//

#경기추가 (배당설정)
delimiter //
create procedure CompetitionList_add
(in 
hometeam varchar(50), #홈팀이름
awayteam varchar(50), #원정팀이름
starttime datetime, #경기시작시간 : 경기시작시간이 되면 경기진행중으로 변경해야함
homeside float(3,2), #홈배당
awayside float(3,2), #원정배당
drawside float(3,2), #무승부배당
state tinyint(1) #state - 1:경기전 , 2: 경기진행중 , 3:경기완료
)
begin 
	insert into CompetitionList (hometeam,awayteam,starttime,homeside,awayside,drawside,state)
	values (hometeam, awayteam, starttime, homeside, awayside, drawside, state);
end
//

#유저 배팅관련
delimiter //
create procedure bettable_add
(in 
accountid_in int(11),
competitionSN_in int(11) , #경기sn
betside_in tinyint(1), #유저선택 1:홈승, 2:무승부, 3:원정승
betmoney_in int(11) #배팅금액
)
begin 

	select @State_out := State from CompetitionList where sn = competitionSN_in;
	select @assets_out := Assets from Account_Assets where accountid = accountid_in;
    
if	@State_out = 1 and @assets_out >= betmoney_in then #경기전일때true #베팅머니가 보유머니보다 작거나같을때true
		update Account_Assets
		set assets = assets - betmoney_in
		where accountid = accountid_in;
	insert into bettable (competitionSN,accountid,betside,betmoney,regdate)
	values (competitionSN_in,accountid_in,betside_in, betmoney_in, now());
else select 0;
end if;

end
//

#경기 상태 수정
delimiter //
create procedure CompetitionList_state_update
(in 
competitionSN int(11), #경기sn
state tinyint(1) #state - 1:경기전 , 2: 경기진행중 , 3:경기완료
)
begin 
	update CompetitionList
	set state = state
	where sn = competitionSN;
end
//

#경기 리스트 (지금 시간 이후)
delimiter //
create procedure CompetitionList_load
()
begin 
	select * from CompetitionList where starttime >= now();
end
//

#배팅내역 추출
delimiter //
create procedure bettable_load
()
begin 
	select * from bettable;
end
//

#유저 보유금액 충전
delimiter //
create procedure Account_Assets_update
(
accountid_in int(11),
assets_in int(11) #충전금액
)
begin 
	update Account_Assets
	set assets = assets+assets_in
	where accountid = accountid_in;
end
//


