-- load to the https://www.db-fiddle.com/

create table users (
   id int not null primary key,
   name varchar(255) not null default '',
   phone varchar(15) not null default '',
   email varchar(255) not null default '',
   created timestamp not null default now()
) ENGINE = InnoDB;

create table orders (
    id int not null primary key,
    subtotal decimal(5,2) not null default 0.00,
    created timestamp not null default now(), -- Y-m-d H:i:s
    city_id int not null default 0,
    user_id  int not null default 0
) ENGINE = InnoDB;


insert into users (id, name, phone, email, created) values
    (1, 'alpha', '+79000000001', 'alpha@email.com', now()),
    (2, 'bravo', '+79000000002', 'bravo@email.com', now()),
    (3, 'charly', '+79000000003', 'charly@email.com', now()),
    (4, 'delta', '+79000000004', 'delta@email.com', now());

insert into orders (id, subtotal, created, city_id, user_id) values
    (1, 110.50, now(), 1, 1),
    (2, 120.50, DATE_SUB(now(), INTERVAL 1 DAY), 2, 2),
    (3, 130.50, DATE_SUB(now(), INTERVAL 2 DAY), 1, 3),
    (4, 140.50, DATE_SUB(now(), INTERVAL 3 DAY), 3, 1),
    (5, 150.50, DATE_SUB(now(), INTERVAL 4 DAY), 1, 2),
    (6, 160.50, DATE_SUB(now(), INTERVAL 5 DAY), 4, 3),
    (7, 170.50, DATE_SUB(now(), INTERVAL 6 DAY), 1, 1),
    (8, 180.50, DATE_SUB(now(), INTERVAL 7 DAY), 5, 2),
    (9, 190.50, DATE_SUB(now(), INTERVAL 8 DAY), 1, 3);


select
    u.name,
    u.phone,
    sum(o.subtotal) as total,
    round(avg(o.subtotal), 2) as avg_subtotal,
    max(o.created) as last_order_date
from users u
         left join orders o on o.user_id=u.id
group by u.name, u.phone;
