--1. [production].[products] աղյուսակին միացնել խանութնոերի անունները, (պետք է գտնել ճանապարհն ու տրամաբանությունը)

--select pp.*, ss.store_name
--from [production].[stocks] ps
--join [sales].[stores] ss on ss.store_id = ps.store_id
--join [production].[products] pp on pp.product_id = ps.product_id
--order by pp.product_id

--2. առաջին կետում ստացված արդյունքը խմբավորել ըստ խանութների անունների
--select ss.store_name, count(*)
--from [production].[stocks] ps
--join [sales].[stores] ss on ss.store_id = ps.store_id
--join [production].[products] pp on pp.product_id = ps.product_id
--group by ss.store_name




--3. [BIkeStores].[sales].[customers] հաշվել թե յուրաքանչյուր նահանգից քանի հաճախորդ ունի խանութը
--select 
--s.state, count(*) as customers
--from [sales].[customers] s
--group by s.state


--4. գտնել ամենաթանկ գնում կատարած հաճախորդի անունը
select
sc.first_name,
sc.last_name
from [sales].[order_items] soi
join [sales].[orders] so on so.order_id = soi.order_id
join [sales].[customers] sc on sc.customer_id = so.customer_id
order by (list_price - (list_price*discount))*quantity desc



--5. գտնել յուրաքանչյուր խանութից առաջին և վերջին պատվերների ամսաթվերը, առանձնացնել այդ ամսաթվերի տարի, ամիս, օր -երը առանձին սյուներով:
--select *, year(y.first_order) as first_order_year, month(y.first_order) as first_order_month, day(y.first_order) as first_order_day
--from
--(select ss.store_name,  min(so.order_date) as first_order, max(so.order_date) as last_order
--from [sales].[orders] so
--join [sales].[stores] ss on ss.store_id = so.store_id
--group by ss.store_name) y


--6. [sales].[staffs] և [sales].[customers] աղյուսակների համապատասխան սյուները միավորել Unionի միջոցով:
--select first_name, last_name, email 
--from [sales].[staffs]
--union
--select first_name, last_name, email
--from [sales].[customers]
