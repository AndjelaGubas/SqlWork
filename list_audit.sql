delimiter //
create procedure list_audit(
	IN p_action_code CHAR(6)
)
begin
	select * from audit;
end//
delimiter ;

alter table audit
	alter column `description` varchar(255);