#�����߰�
delimiter //
create procedure account_add
(in 
emailid_in varchar(32), #�α���id
username_in varchar(32) #�г���
)

begin
	#BEGIN
    select @emailid_out := emailid from account where emailid = emailid_in;
    select @username_out := username from account where username = username_in;
    
    if (@emailid_out = emailid_in or @username_out= username_in) then
    
	select '���� �̸���ID�̰ų� ���� �г��� �Դϴ�' as comment;
	
    else 
    
    insert into account (emailid,username,regdate) values (emailid_in, username_in, now());

	select @accountid_into := accountid from account where emailid = emailid_in;
    insert into Account_Assets (accountid,assets) values (@accountid_into, 0);
    
    
    end if;
	#END;

end
//

#����߰� (��缳��)
delimiter //
create procedure CompetitionList_add
(in 
hometeam varchar(50), #Ȩ���̸�
awayteam varchar(50), #�������̸�
starttime datetime, #�����۽ð� : �����۽ð��� �Ǹ� ������������� �����ؾ���
homeside float(3,2), #Ȩ���
awayside float(3,2), #�������
drawside float(3,2), #���ºι��
state tinyint(1) #state - 1:����� , 2: ��������� , 3:���Ϸ�
)
begin 
	insert into CompetitionList (hometeam,awayteam,starttime,homeside,awayside,drawside,state)
	values (hometeam, awayteam, starttime, homeside, awayside, drawside, state);
end
//

#���� ���ð���
delimiter //
create procedure bettable_add
(in 
accountid int(11),
competitionSN int(11) , #���sn
betside tinyint(1), #�������� 1:Ȩ��, 2:���º�, 3:������
betmoney int(11) #���ñݾ�
)
begin 
	declare A int(11);
	declare State tinyint(1);
	
	select State into State from CompetitionList where sn = competitionSN;
	select assets into A from Account_Assets where accountid = accountid;
if	state = 1 then #������϶�true

	if A >= betmoney then #���øӴϰ� �����ӴϺ��� �۰ų�������true
		update Account_Assets
		set assets = assets-betmoney
		where accountid = accountid;
	insert into bettable (competitionSN,accountid,betside,betmoney,regdate)
	values (competitionSN,accountid,betside, betmoney, now());
	else select 1;
	end if;
else select 0;
end if;

end
//

#��� ���� ����
delimiter //
create procedure CompetitionList_state_update
(in 
competitionSN int(11), #���sn
state tinyint(1) #state - 1:����� , 2: ��������� , 3:���Ϸ�
)
begin 
	update CompetitionList
	set state = state
	where sn = competitionSN;
end
//

#��� ����Ʈ (���� �ð� ����)
delimiter //
create procedure CompetitionList_load
()
begin 
	select * from CompetitionList where starttime >= now();
end
//

#���ó��� ����
delimiter //
create procedure bettable_load
()
begin 
	select * from bettable;
end
//

#���� �����ݾ� ����
delimiter //
create procedure Account_Assets_update
(
accountid_in int(11),
assets_in int(11) #�����ݾ�
)
begin 
	update Account_Assets
	set assets = assets+assets_in
	where accountid = accountid_in;
end
//


