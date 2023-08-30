-- ���̺� ��� ��ȸ
select * from tab;

drop table member;
drop table board;
drop sequence seq_borad_num;

-- ȸ�� ���̺� �����
create table member(
    id varchar2(10) not null,
    pass varchar2(10) not null,
    name varchar2(30) not null,
    regidate date default sysdate not null,
    primary key (id)
);

-- ��1 ����� �Խ��� ���̺� �����
create table board (
    num number primary key,
    title varchar2(200) not null,
    content varchar2(2000) not null,
    id varchar2(10) not null,
    postdate date default sysdate not null,
    visitcount number(6)
);

-- �ܷ�Ű ����
alter table board
    add constraint board_mem_fk FOREIGN key (id)
    REFERENCES member(id);

-- ������ ����
create sequence seq_board_num
    increment by 1  -- 1�� ����
    start with 1    -- ���۰� 1
    minvalue 1      -- �ּҰ� 1
    nomaxvalue      -- �ִ밪�� ���Ѵ�
    nocycle         -- ��ȯ���� ����
    nocache;        -- ĳ�� �� ��

-- ���� ������ �Է�
insert into member (id, pass, name) values ('musthave', '1234', '�ӽ�Ʈ�غ�');
insert into board (num, title, content, id, postdate, visitcount)
    values (seq_board_num.nextval, '����1�Դϴ�', '����1�Դϴ�', 'musthave',
        sysdate, 0);
commit;

SELECT COUNT(*) FROM board WHERE title LIKE '%2%';
SELECT * FROM board WHERE title LIKE '%1%';

INSERT INTO board VALUES (seq_board_num.nextval, '������ ���Դϴ�', '���ǿ���', 'musthave', sysdate, 0);
INSERT INTO board VALUES (seq_board_num.nextval, '������ �����Դϴ�', '�������', 'musthave', sysdate, 0);
INSERT INTO board VALUES (                                                                                                                     seq_board_num.nextval, '������ �����Դϴ�', '������ȭ', 'musthave', sysdate, 0);
INSERT INTO board VALUES (seq_board_num.nextval, '������ �ܿ��Դϴ�', '�ܿ￬��', 'musthave', sysdate, 0);

commit;

desc member;
select * from member;
select id, pass, rownum from member;

select * from (
    select Tb.*, rownum rNum from (
        select * from board order by num desc
    ) Tb
)
where rNum between 1 and 10;

-- 12�� ���� ���ε�
create table myfile (
    idx number primary key,
    name varchar2(50) not null,
    title varchar2(200) not null,
    cate varchar2(30),
    ofile varchar2(100) not null,
    sfile varchar2(30) not null,
    postdate date default sysdate not null
);
desc myfile;
drop table myfile;

drop table mvcboard;
-- ��2 ����� ����÷���� �Խ��� ���̺� ����
create table mvcboard (
    idx number primary key,
    name varchar2(50) not null,
    title varchar2(200) not null,
    content varchar2(2000) not null,
    postdate date default sysdate not null,
    ofile varchar2(200),
    sfile varchar2(30),
    downcount number(5) default 0 not null,
    pass varchar2(50) not null,
    visitcount number default 0 not null
);
desc mvcboard;

-- ���̵����� �Է�
insert into mvcboard (idx, name, title, content, pass)
    values (seq_board_num.nextval, '������', '�ڷ�� ����1 �Դϴ�.','����','1234');
insert into mvcboard (idx, name, title, content, pass)
    values (seq_board_num.nextval, '�庸��', '�ڷ�� ����2 �Դϴ�.','����','1234');
insert into mvcboard (idx, name, title, content, pass)
    values (seq_board_num.nextval, '�̼���', '�ڷ�� ����3 �Դϴ�.','����','1234');
insert into mvcboard (idx, name, title, content, pass)
    values (seq_board_num.nextval, '������', '�ڷ�� ����4 �Դϴ�.','����','1234');
insert into mvcboard (idx, name, title, content, pass)
    values (seq_board_num.nextval, '������', '�ڷ�� ����5 �Դϴ�.','����','1234');
    
commit;

