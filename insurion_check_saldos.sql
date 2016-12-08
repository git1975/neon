select d.id, d.status,
(SELECT a.isactive*(ifnull((SELECT sum(ifnull(amount, 0)) FROM accounting WHERE iduser=85 AND idktaccount=a.id and iddeal=d.id), 0) - 
ifnull((SELECT sum(ifnull(amount, 0)) FROM accounting WHERE iduser=85 AND iddtaccount=a.id and iddeal=d.id), 0)) saldo from account a where a.number = 'A0003') saldo
from deal d
join userdeals ud on ud.iddeal=d.id
where ud.iduser=85;

