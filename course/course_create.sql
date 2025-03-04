create table if not exists "empolyee"
(
    "id" serial primary key,
    "name" varchar(32) not null
);

create table if not exists "client"
(
    "id" serial primary key,
    "name" varchar(32) not null
);

create table if not exists "login0"
(
    "id" serial primary key,
    "code" text not null,
    "client_id" integer references client(id)
);


create table if not exists "supplier"
(
    "id" serial primary key,
    "name" varchar(32) not null
);

create table if not exists "wholesaler"
(
    "id" serial primary key,
    "name" varchar(32) not null
);

create table if not exists "online_store"
(
    "id" serial primary key,
    "adress" text not null
);

create table if not exists "offline_store"
(
    "id" serial primary key,
    "adress" text not null
);

create table if not exists "self_sale"
(
    "id" serial primary key,
    "online_store_id" integer references online_store(id) ,
    "offline_store_id" integer references offline_store(id)
);

create table if not exists "storehouse"
(
    "id" serial primary key,
    "supplier_id" integer references supplier(id),
    "wholesaler_id" integer references wholesaler(id),
    "self_sale_id" integer references self_sale(id),
    UNIQUE("id","supplier_id","wholesaler_id","self_sale_id")
);

create table if not exists "order"
(
    "id" serial primary key,
    "empolyee_id" integer references empolyee(id),
    "client_id" integer references client(id),
    "storehouse_id" integer references storehouse(id),
    "status" text,
UNIQUE ("id","empolyee_id", "client_id","storehouse_id","status")
);


