Create database dbDD;
Create database dbddt;
Create database dbddtp;

use dbdd;
select * from empresas;
Create table empresas(
id int auto_increment primary key,
correo varchar(30) not null unique,
rfc varchar(13) not null unique,
nomdueno varchar(50) not null,
nombre varchar(50) not null,
password_digest varchar(100) not null
);  
Alter table empresas modify column password_digest varchar(100);
Create table sucursals(
id int auto_increment primary key,
eid int,
nsuc varchar(50) not null,
ncalle varchar(30) not null,
ncol varchar(30) not null,
numext int not null,
numint int not null,
cpost int not null,
ciudad varchar(30) not null,
pais varchar(30) not null,
constraint fk_emp_suc foreign key(eid) references empresas(id)
);

Create table empleados(
sid int not null,
nemp varchar(50) not null,
rfc varchar(13) primary key,
npuesto varchar(30) not null,
constraint fk_empleado_suc foreign key(sid) references sucursals(id)
);
ALTER TABLE sucursals RENAME COLUMN eid TO empresa_id;
ALTER TABLE empleados RENAME COLUMN sid TO sucursal_id;

alter table sucursals drop primary key, add primary key(id);
alter table empleados add constraint fk_empleado_suc foreign key(sid) references sucursals(id);