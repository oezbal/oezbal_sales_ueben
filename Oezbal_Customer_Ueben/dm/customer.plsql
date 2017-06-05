create or replace procedure proc_ct_Customer is
  v_tabcnt number;
BEGIN
  select count(*) into v_tabcnt
  from all_tables
  where table_name = 'Customer' and Owner = 'oezbal';
  if v_tabcnt = 0 then
    execute immediate 'create table Customer(
                        customer_id integer primary key,
                        first_name varchar(20),
                        credit decimal(10,2)
                        )';
  commit;
  end if;
end proc_ct_Customer;