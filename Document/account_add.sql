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
