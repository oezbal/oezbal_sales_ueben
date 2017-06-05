create or replace procedure proc_ct_Customer is
  v_tabcnt number;
BEGIN
  select count(*) into v_tabcnt
  from all_tables
  where table_name = 'Customer' and Owner = 'selahattin';
  if v_tabcnt = 0 then
    execute immediate 'create table Customer(
                        customer_id integer primary key,
                        first_name varchar(20),
                        credit decimal(10,2)
                        )';
  commit;
  end if;
  
  select count(*) into v_tabcnt from all_sequences
  where sequence_name = 'seq_customer_id' and sequence_owner = 'selahattin';
  if v_tabcnt = 0 then
  execute immediate 'create sequence seq_customer_id
      start with 1
      increment by 1
       cache 20';
commit;
end if;
end proc_ct_Customer;


insert into customer values (seq_customer_id.NEXTVAL,'Selo',10);