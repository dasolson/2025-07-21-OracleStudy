select * from replyboard
order by group_id DESC;

delete from replyboard
where no>4;

commit;
