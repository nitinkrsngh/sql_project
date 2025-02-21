show tables;
select * from sales;

#----------------------------------------------- Query 1 -----------------------------------------------------

select SaleDate, Amount
from sales
where Amount > 10000 AND year(SaleDate) = 2022
order by Amount desc;

#-------------------------------------------------------Query2---------------------------------------------------------

select * from sales
where boxes BETWEEN 0 and 50;

#-------------------------------------------------------Query3---------------------------------------------------------

select SaleDate, Amount, Boxes, weekday(SaleDate) as 'Day of week'
from sales 
where weekday(saleDate) = 4;

#-------------------------------------------------------Query4---------------------------------------------------------

select SaleDate, Amount,
		             case when amount < 1000 then 'Under 1k'
					      when amount < 5000 then 'Under 5k'
                          when amount < 10000 then 'Under 10k'
					    else '10k or more'
				     end as 'Amount category'
from sales;

#-------------------------------------------------------Query5---------------------------------------------------------

select s.Saledate, s.amount, pr.product
from sales s
left join products pr on s.PID = pr.PID;

#-------------------------------------------------------Query6---------------------------------------------------------

select s.saledate, s.amount, p.Salesperson, pr.product, p.team
from sales s
join products pr on pr.pid = s.pid
join people p on p.SPID = s.SPID
where s.amount < 500;

#-------------------------------------------------------Query7---------------------------------------------------------

select GeoID, sum(amount)
from sales
group by geoID;

#-------------------------------------------------------Query8---------------------------------------------------------

select pr.category, p.team, sum(boxes), sum(amount)
from sales s
join people p on p.spid = s.spid
join products pr on pr.pid = s.pid
where p.team <> ''
group by pr.category, p.team
order by pr.category, p.team;

#-------------------------------------------------------Query9---------------------------------------------------------

select pr.product, sum(s.amount) as 'Total Amount'
from sales s 
join products pr on pr.PID = s.PID
group by pr.product
order by 'Total Amount' desc
limit 10;

#-------------------------------------------------------Query10---------------------------------------------------------

select p.salesperson, count(*) as 'Shipment Count'
from sales s
join people p on p.SPID = s.SPID
where s.SaleDate BETWEEN '2022-1-1' and '2022-1-31'
group by p.salesperson;

#-------------------------------------------------------Query11---------------------------------------------------------

select pr.product, sum(s.boxes) as 'Total Boxes'
from sales s
join products pr on pr.PID = s.PID
where pr.product in ('Milk Bars' , 'Eclairs')
group by pr.product;

#-------------------------------------------------------Query12---------------------------------------------------------

select pr.product, sum(s.boxes) as 'Total Boxes'
from sales s
join products pr on pr.PID = s.PID
where pr.product in ('Milk Bars' , 'Eclairs') AND s.saledate between '2022-2-1' and '2022-2-7'
group by pr.product;

#-------------------------------------------------------Query13---------------------------------------------------------

select *,
case when weekday(saledate)=2 then 'Wednesday_Shipment'
else ''
end as 'W_Shipment'
from sales
where customers < 100 and boxes < 100;


