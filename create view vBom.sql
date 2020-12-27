create view vBom
as
with recursive rec_composition(level,parent,child,class,product,quantity,usedquantity)
as 
(
select cast(1 as numeric) as level
      ,c.parent
      ,c.child
      ,cast(c.child as text) as class
      ,c.child as product
      ,c.quantity
      ,c.quantity as usedquantity
  from composition c
 where c.parent is null
 
 union 
 
select p.level + 1 as level
      ,c.parent
      ,c.child
      ,p.class || '->' || c.child as class
      ,cast(substring(p.class from 1 for 3) as varchar(3)) as product
      ,c.quantity
      ,p.quantity * c.quantity as usedquantity
  from rec_composition p
 inner join composition c
    on p.child = c.parent
)
select level
      ,parent
      ,child
      ,class
      ,product
      ,quantity
      ,sum(usedquantity) as usedquantity
  from rec_composition
 group by level
      ,parent
      ,child
      ,class
      ,product
      ,quantity

 order by product
     ,level
     ,parent
     ,child