--회원들의 정보 테이블
select * from member;
drop table member;

create table member(
	name varchar2(12),
	id varchar2(15) primary key,
	pwd varchar2(15),
	nickname varchar2(20),
	intro varchar2(50),
	theme varchar2(10)
);

insert into member values('관리자', 'admin', '1234', '관리자입니다', '관리자 소개글입니다.', 'grey');
insert into member values('조희연', 'whgmldus', '1234', '희연조', '조희연입니다.', 'pink');
insert into member values('우예인', 'wooyein3', '1234', '우예인예우', '우예인입니다.', 'yellow');
insert into member values('이동원', 'dlehddnjs', '1234', '동원이', '이동원입니다.', 'skyblue');
insert into member values('이창연', 'dlckddus', '1234', '창연이', '이창연입니다.', 'purple');
insert into member values('박홍식', 'qkrghdtlr', '1234', '홍식박', '박홍식입니다.', 'beige');

delete from member where id='admin';

select theme from member;

--친구 목록 정보 테이블
select * from friend;
drop table friend;

create table friend(
	my_id varchar2(15),
	friend_id varchar2(15),
	favorite varchar2(1),
	primary key(my_id, friend_id)
);

-- 관리자는 모두와 친구, 예인과 희연은 서로 친구, 창연과 홍식은 서로 친구 인걸로 예를 듦
insert into friend values('admin', 'whgmldus', 'Y');
insert into friend values('admin', 'wooyein3', 'N');
insert into friend values('admin', 'dlehddnjs', 'Y');
insert into friend values('admin', 'dlckddus', 'N');
insert into friend values('admin', 'qkrghdtlr', 'Y');

insert into friend values('whgmldus', 'admin', 'N');
insert into friend values('whgmldus', 'wooyein3', 'Y');
insert into friend values('wooyein3', 'admin', 'N');
insert into friend values('wooyein3', 'whgmldus', 'Y');
insert into friend values('dlckddus', 'qkrghdtlr', 'N');
insert into friend values('qkrghdtlr', 'dlckddus', 'Y');

--친구 삭제를 위한 sql
delete from friend where my_id = 'whgmldus' and friend_id = 'admin';
--친구 목록을 가져오기 위한 sql
select * from friend where my_id='whgmldus' and friend_id='admin';
--친구 검색
select id from member where id='admin';
--친구가 추가되어있는지 확인하는 sql
select my_id, friend_id from friend where my_id='whgmldus' and friend_id='dlehddnjs';

--즐겨찾기에서 친구의 별명을 가져오기 위한 sql
select my_id, m.nickname, friend_id, favorite from member m, friend f where m.id = f.friend_id order by my_id;

--글 테이블
drop table post;

create table post(
	postno number(5) not null,
	title varchar2(30),
	content varchar2(500),
	writer varchar2(20)
);
create sequence post_seq start with 1 increment by 1 maxvalue 9999;
drop sequence post_seq;

insert into post values(post_seq.nextval, '제목', '글 내용이 들어갈 자리', 'admin');
insert into post values(post_seq.nextval, '제목1', '글 내용이 들어갈 자리1', 'admin');
insert into post values(post_seq.nextval, '제목2', '글 내용이 들어갈 자리2', 'whgmldus');

select * from post order by postno desc;