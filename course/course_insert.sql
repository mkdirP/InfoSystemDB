create or replace function fill_empolyee() returns void as $$
DECLARE
    i int = 0;
    names varchar(32)[] = array ['Blazer', 'Haven', 'Tony','Peter','Bob','John','Tomas','Alex','Anna'];
BEGIN
    while i < 1000000 loop
    insert into "empolyee"(name)
    values (names[i%9+1]);
    i = i + 1;
    end loop;
end;
$$ language plpgsql;
select fill_empolyee();


create or replace function fill_client() returns void as $$
DECLARE
    i int = 0;
    names varchar(32)[] = array ['Aim', 'Bim', 'Cim','Dim','Eim','Fim','Gim','Him','Iim'];
BEGIN
    while i < 1000000 loop
    insert into "client"(name)
    values (names[i%9+1]);
    i = i + 1;
    end loop;
end;
$$ language plpgsql;
select fill_client();


create or replace function fill_login0() returns void as $$
DECLARE
    i int = 0;
BEGIN
    while i < 1000000 loop
    insert into "login0"(code, client_id)
    values ('11223344', i%1000000 + 1);
    i = i + 1;
    end loop;
end;
$$ language plpgsql;
select fill_login0();


create or replace function fill_supplier() returns void as $$
DECLARE
    i int = 0;
    names varchar(32)[] = array ['Nike', 'Nike', 'Adidas','Reebok','X','361c'];
BEGIN
    while i < 1000000 loop
    insert into "supplier"(name)
    values (names[i%6+1]);
    i = i + 1;
    end loop;
end;
$$ language plpgsql;
select fill_supplier();


create or replace function fill_wholesaler() returns void as $$
DECLARE
    i int = 0;
    names varchar(32)[] = array ['ShiHuo', 'poison', 'AKA','BKB','CKC','DKD'];
BEGIN
    while i < 1000000 loop
    insert into "wholesaler"(name)
    values (names[i%6+1]);
    i = i + 1;
    end loop;
end;
$$ language plpgsql;
select fill_wholesaler();


create or replace function fill_online_store() returns void as $$
DECLARE
    i int = 0;
    adresses varchar(32)[] = array ['www.store1.com', 'www.store2.com', 'www.store3.com','www.store4.com','www.store5.com','www.store6.com'];
BEGIN
    while i < 1000000 loop
    insert into "online_store"(adress)
    values (adresses[i%6+1]);
    i = i + 1;
    end loop;
end;
$$ language plpgsql;
select fill_online_store();


create or replace function fill_offline_store() returns void as $$
DECLARE
    i int = 0;
    adresses varchar(32)[] = array ['Nevsky Prospekt', 'Romanosov street', 'Albat street','Krovel street', 'AAA street','BBB street','CCC street'];
BEGIN
    while i < 1000000 loop
    insert into "offline_store"(adress)
    values (adresses[i%7+1]);
    i = i + 1;
    end loop;
end;
$$ language plpgsql;
select fill_offline_store();


create or replace function fill_self_sale() returns void as $$
DECLARE
    i int = 0;
BEGIN
    while i < 1000000 loop
    insert into "self_sale"(online_store_id, offline_store_id)
    values (i%1000000 + 1, i%1000000 + 1);
    i = i + 1;
    end loop;
end;
$$ language plpgsql;
select fill_self_sale();


create or replace function fill_storehouse() returns void as $$
DECLARE
    i int = 0;
BEGIN
    while i < 1000000 loop
    insert into "storehouse"(supplier_id,wholesaler_id,self_sale_id)
    values (i%1000000 + 1, i%1000000 + 1, i%1000000 + 1);
    i = i + 1;
    end loop;
end;
$$ language plpgsql;
select fill_storehouse();


create or replace function fill_order() returns void as $$
DECLARE
    i int = 0;
BEGIN
    while i < 1000000 loop
    insert into "order"(empolyee_id,client_id,storehouse_id,status)
    values (i%1000000 + 1, i%1000000 + 1,i%1000000 + 1, 'Regular');
    i = i + 1;
    end loop;
end;
$$ language plpgsql;
select fill_order();