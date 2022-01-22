--main
drop database if exists bbdd;
create database bbdd;

\c bbdd;

create table cliente(nrocliente int,
nombre text, apellido text,
domicilio text,
telefono char(12));
insert into cliente values(1, 'Losa', 'Pastor', 'Ingeniero Agustin Rosas 95', 11-5487-9827);
insert into cliente values(2, 'Celestina', 'Lobo', 'Av Rivadavia 1391', 11-9159-7968);
insert into cliente values(3, 'Belen', 'Torre', 'San Miguel', 11-0243-8815);
insert into cliente values(4, 'Alenjadro', 'Pacheco', 'Alte Brown 134', 11-9852-1632);
insert into cliente values(5, 'Miguel', 'Rey', 'Yrigoyen 865', 11-9659-6755);
insert into cliente values(6, 'Eliana', 'Roldan', 'General Hornos 1094', 11-5139-2645);
insert into cliente values(7, 'Rios', 'Gutierrez', 'Gral Jose Maria Paz 54', 11-3702-7970);
insert into cliente values(8, 'Aurelia', 'Calvo', 'Av Gral San Martin 793', 11-4791-5080);
insert into cliente values(9, 'Lalo', 'Hierro', 'San Carlos', 11-2613-1810);
insert into cliente values(10, 'Maria', 'Bustos', 'Congreso', 11-4701-9731);
insert into cliente values(11, 'Andres', 'Arco', 'Santa Fe 8112',11-3822-4356);
insert into cliente values(12, 'Abel', 'Cuevas', 'Gral Palacios', 11-4243-6288);
insert into cliente values(13, 'Bella', 'Rocha', 'San Lorenzo 1163', 11-3414-9325);
insert into cliente values(14, 'Luna', 'Modesto', 'Avenida 44', 11-2214-2124);
insert into cliente values(15, 'Omar', 'Pareja', 'Loria 135', 11-4245-3364);
insert into cliente values(16, 'Fausto', 'Sola', 'Av Roca 89', 11-1424-9684);
insert into cliente values(17, 'Francisco', 'Armida', 'Av Beiro', 11-4568-2493);
insert into cliente values(18, 'Juan', 'Garcia', 'Elicagaray', 11-2983-1288);
insert into cliente values(19, 'Felipe', 'Portillo', 'Francia 797', 11-2914-1231);
insert into cliente values(20, 'Andres', 'Seron', 'Maipu 875', 11-4144-7897);

alter table cliente add constraint cliente_pk primary key(nrocliente);

--------------------------------------------------------------

create table tarjeta(nrotarjeta char(16),nrocliente int, validadesde char(6), validahasta char(6), codseguridad char(4),limitecompra decimal(8,2), estado char(10));
insert into tarjeta values(5433106642764443, 1, 202007, 202107, 3419, 120000.00, 'suspendida');
insert into tarjeta values(4716158452535062, 2, 202112, 202212, 6490, 50000.00, 'suspendida');
insert into tarjeta values(4916984881290831, 3, 202206, 202306, 2381, 500.00, 'vigente');
insert into tarjeta values(5147940594640906, 4, 201910, 202010, 4479, 155000.00,'anulada');
insert into tarjeta values(4716784434325243, 5, 201812, 201912, 4549, 2000.00,'vigente');
insert into tarjeta values(4539303610051842, 6, 202212, 202312, 3071, 80000.00, 'vigente');
insert into tarjeta values(5431767880175981, 7, 201012, 212312, 7562, 75000.00, 'vigente');
insert into tarjeta values(5218432545801563, 8, 201212, 211512, 0672, 89999.99, 'suspendida');
insert into tarjeta values(5242585157876901, 9, 202311, 212311, 9847, 235000.00,'anulada');
insert into tarjeta values(5876459867342789, 10,203012, 213012, 1403, 67000.00, 'anulada');
insert into tarjeta values(5765986753427890, 11,202711, 212712, 5396, 139500.00,'suspendida');
insert into tarjeta values(5243768891094746, 12,202812, 213011, 4286, 25800.00, 'vigente');
insert into tarjeta values(5265789653478240, 13,202912, 213011, 0132, 67890.00, 'vigente');
insert into tarjeta values(9300209054407260, 14,180114, 211125, 5600, 245900.00,'vigente');
insert into tarjeta values(5759390918402344, 15,181201, 231204, 8090, 58500.00, 'anulada');
insert into tarjeta values(5330309124375948, 16,200429, 221213, 5285, 45600.00, 'suspendida');
insert into tarjeta values(4404838592103475, 17,201015, 211123, 0951, 90200.00, 'anulada');
insert into tarjeta values(8193402929303759, 18,170901, 220718, 4677, 60590.55, 'vigente');

--repiten tarjetas 
insert into tarjeta values(1357348958725093, 19,201205, 240230, 0805, 85750.99, 'vigente');
insert into tarjeta values(9039147583600367, 19,170713, 211210, 4290, 22000.00, 'expirada');
insert into tarjeta values(2934350982193503, 20,201114, 211218, 1451, 15500.55, 'vigente');
insert into tarjeta values(4673467696234133, 20,190330, 220415, 2741, 60370.00, 'expirada');


alter table tarjeta add constraint tarjeta_pk primary key(nrotarjeta);
alter table tarjeta add constraint tarjeta_fk foreign key(nrocliente) references cliente(nrocliente);

--------------------------------------------------------------
create table comercio(nrocomercio int, nombre text, domicilio text, codigopostal char(8), telefono char(12));
insert into comercio values(1, 'Avicar', 'Av Las Heras 3301', 'C1425ASK', 11-6644-5584);
insert into comercio values(2, 'Carrefour', 'Av. Pte. J. D. Peron 111', 'B1662ASB',11-3692-3133 );
insert into comercio values(3, 'Cerealera J&G', 'Domingo Faustino Sarmiento 1663', 'B1663GFK', 11-3284-1926);
insert into comercio values(4, 'Kala', 'Av Avellaneda 497','C1406FYM', 11-2701-2799);
insert into comercio values(5, 'MegaCompras', 'Congreso 833', 'B1663JGF', 11-6616-9413 );
insert into comercio values(6, 'Optishop', 'Justo Jose de Urquiza 4775', 'B1678AEC', 11-3324-0243);
insert into comercio values(7, 'McDonalds', 'Av. Pte. J. D. Peron 1522', 'B1663GFK', 11-2401-0679);
insert into comercio values(8, 'Cremolatti', 'Santos Vega 5798', 'B1682AIB', 11-4844-4544);
insert into comercio values(9, 'Coto', 'Almte. Guillermo Brown 1300', 'B1708EFY', 11-4489-0118);
insert into comercio values(10, 'Prater Bar', 'Rodriguez Pena 1399', 'B1712JQM', 11-4627-0772);
insert into comercio values(11, 'JD Graniero', 'C. Jose Maria Paz 1201', 'B1714MUU', 11-2518-4432);
insert into comercio values(12, 'El Molinito', 'Independencia 3002', 'B1722CDI', 11-0483-2097);
insert into comercio values(13, 'Decohogar', 'Cervantes 321', 'B1617EHG', 11-4736-7500);
insert into comercio values(14, 'Coto', 'Av. Pte hipolito yrigoyen 1826', 'C1167EJG', 11-4846-7001);
insert into comercio values(15, 'Mostaza', 'Belgrano 86', 'A1682BCD', 11-2349-6664);
insert into comercio values(16, 'YPF', 'Av. Pte Arturo Umberto Illia 2604', 'B1754KJV', 11-7422-7068);
insert into comercio values(17, 'Burger King', 'Av. Dr. Ignacio Arieta 3545', 'B1716AMG', 11-2654-1098);
insert into comercio values(18, 'Consecionario Fiat Taraborelli', 'Av. San Martin 3078', 'C1416LKM', 11-4350-9861);
insert into comercio values(19, 'Fravega', 'Rivadavia 6513','C1406GFR', 11-4987-2606);
insert into comercio values(20, 'Musimundo', 'Av. Gral. Francisco De La Cruz 4602', 'C1437FDR', 11-3574-2230);


alter table comercio add constraint comercio_pk primary key(nrocomercio);

----------------------------------------------------------------

create table compra(nrooperacion serial, nrotarjeta char(16), nrocomercio int, fecha timestamp, monto decimal(7,2), pagado boolean);

alter table compra add constraint compraoperacion_pk primary key(nrooperacion);
alter table compra add constraint compratarjeta_fk foreign key(nrotarjeta) references tarjeta(nrotarjeta);
alter table compra add constraint compracomercio_fk foreign key(nrocomercio) references comercio(nrocomercio);

----------------------------------------------------------------

create table rechazo(nrorechazo serial, nrotarjeta char(16), nrocomercio int, fecha timestamp, monto decimal(7,2), motivo text);

alter table rechazo add constraint rechazo_pk primary key(nrorechazo);
alter table rechazo add constraint rechazotarjeta_fk foreign key(nrotarjeta) references tarjeta(nrotarjeta);
alter table rechazo add constraint rechazocomercio_fk foreign key(nrocomercio) references comercio(nrocomercio);

----------------------------------------------------------------

create table cierre(anio int, mes int, terminacion int, fechainicio date, fechacierre date, fechavto date);
insert into cierre values(2021, 01, 1, '2021-01-01', '2021-02-01', '2021-02-16');
insert into cierre values(2021, 01, 2, '2021-01-02', '2021-02-02', '2021-02-17');
insert into cierre values(2021, 01, 3, '2021-01-03', '2021-02-03', '2021-02-18');
insert into cierre values(2021, 01, 4, '2021-01-04', '2021-02-04', '2021-02-19');
insert into cierre values(2021, 01, 5, '2021-01-05', '2021-02-05', '2021-02-20');
insert into cierre values(2021, 01, 6, '2021-01-06', '2021-02-06', '2021-02-21');
insert into cierre values(2021, 01, 7, '2021-01-07', '2021-02-07', '2021-02-22');
insert into cierre values(2021, 01, 8, '2021-01-08', '2021-02-08', '2021-02-23');
insert into cierre values(2021, 01, 9, '2021-01-09', '2021-02-09', '2021-02-24');
insert into cierre values(2021, 01, 0, '2021-01-10', '2021-02-10', '2021-02-25');
insert into cierre values(2021, 02, 1, '2021-02-01', '2021-03-01', '2021-03-16');
insert into cierre values(2021, 02, 2, '2021-02-02', '2021-03-02', '2021-03-17');
insert into cierre values(2021, 02, 3, '2021-02-03', '2021-03-03', '2021-03-18');
insert into cierre values(2021, 02, 4, '2021-02-04', '2021-03-04', '2021-03-19');
insert into cierre values(2021, 02, 5, '2021-02-05', '2021-03-05', '2021-03-20');
insert into cierre values(2021, 02, 6, '2021-02-06', '2021-03-06', '2021-03-21');
insert into cierre values(2021, 02, 7, '2021-02-07', '2021-03-07', '2021-03-22');
insert into cierre values(2021, 02, 8, '2021-02-08', '2021-03-08', '2021-03-23');
insert into cierre values(2021, 02, 9, '2021-02-09', '2021-03-09', '2021-03-24');
insert into cierre values(2021, 02, 0, '2021-02-10', '2021-03-10', '2021-03-25');
insert into cierre values(2021, 03, 1, '2021-03-01', '2021-04-01', '2021-04-16');
insert into cierre values(2021, 03, 2, '2021-03-02', '2021-04-02', '2021-04-17');
insert into cierre values(2021, 03, 3, '2021-03-03', '2021-04-03', '2021-04-18');
insert into cierre values(2021, 03, 4, '2021-03-04', '2021-04-04', '2021-04-19');
insert into cierre values(2021, 03, 5, '2021-03-05', '2021-04-05', '2021-04-20');
insert into cierre values(2021, 03, 6, '2021-03-06', '2021-04-06', '2021-04-21');
insert into cierre values(2021, 03, 7, '2021-03-07', '2021-04-07', '2021-04-22');
insert into cierre values(2021, 03, 8, '2021-03-08', '2021-04-08', '2021-04-23');
insert into cierre values(2021, 03, 9, '2021-03-09', '2021-04-09', '2021-04-24');
insert into cierre values(2021, 03, 0, '2021-03-10', '2021-04-10', '2021-04-25');
insert into cierre values(2021, 04, 1, '2021-04-01', '2021-05-01', '2021-05-16');
insert into cierre values(2021, 04, 2, '2021-04-02', '2021-05-02', '2021-05-17');
insert into cierre values(2021, 04, 3, '2021-04-03', '2021-05-03', '2021-05-18');
insert into cierre values(2021, 04, 4, '2021-04-04', '2021-05-04', '2021-05-19');
insert into cierre values(2021, 04, 5, '2021-04-05', '2021-05-05', '2021-05-20');
insert into cierre values(2021, 04, 6, '2021-04-06', '2021-05-06', '2021-05-21');
insert into cierre values(2021, 04, 7, '2021-04-07', '2021-05-07', '2021-05-22');
insert into cierre values(2021, 04, 8, '2021-04-08', '2021-05-08', '2021-05-23');
insert into cierre values(2021, 04, 9, '2021-04-09', '2021-05-09', '2021-05-24');
insert into cierre values(2021, 04, 0, '2021-04-10', '2021-05-10', '2021-05-25');
insert into cierre values(2021, 05, 1, '2021-05-01', '2021-06-01', '2021-06-16');
insert into cierre values(2021, 05, 2, '2021-05-02', '2021-06-02', '2021-06-17');
insert into cierre values(2021, 05, 3, '2021-05-03', '2021-06-03', '2021-06-18');
insert into cierre values(2021, 05, 4, '2021-05-04', '2021-06-04', '2021-06-19');
insert into cierre values(2021, 05, 5, '2021-05-05', '2021-06-05', '2021-06-20');
insert into cierre values(2021, 05, 6, '2021-05-06', '2021-06-06', '2021-06-21');
insert into cierre values(2021, 05, 7, '2021-05-07', '2021-06-07', '2021-06-22');
insert into cierre values(2021, 05, 8, '2021-05-08', '2021-06-08', '2021-06-23');
insert into cierre values(2021, 05, 9, '2021-05-09', '2021-06-09', '2021-06-24');
insert into cierre values(2021, 05, 0, '2021-05-10', '2021-06-10', '2021-06-25');
insert into cierre values(2021, 06, 1, '2021-06-01', '2021-07-01', '2021-07-16');
insert into cierre values(2021, 06, 2, '2021-06-02', '2021-07-02', '2021-07-17');
insert into cierre values(2021, 06, 3, '2021-06-03', '2021-07-03', '2021-07-18');
insert into cierre values(2021, 06, 4, '2021-06-04', '2021-07-04', '2021-07-19');
insert into cierre values(2021, 06, 5, '2021-06-05', '2021-07-05', '2021-07-20');
insert into cierre values(2021, 06, 6, '2021-06-06', '2021-07-06', '2021-07-21');
insert into cierre values(2021, 06, 7, '2021-06-07', '2021-07-07', '2021-07-22');
insert into cierre values(2021, 06, 8, '2021-06-08', '2021-07-08', '2021-07-23');
insert into cierre values(2021, 06, 9, '2021-06-09', '2021-07-09', '2021-07-24');
insert into cierre values(2021, 06, 0, '2021-06-10', '2021-07-10', '2021-07-25');
insert into cierre values(2021, 07, 1, '2021-07-01', '2021-08-01', '2021-08-16');
insert into cierre values(2021, 07, 2, '2021-07-02', '2021-08-02', '2021-08-17');
insert into cierre values(2021, 07, 3, '2021-07-03', '2021-08-03', '2021-08-18');
insert into cierre values(2021, 07, 4, '2021-07-04', '2021-08-04', '2021-08-19');
insert into cierre values(2021, 07, 5, '2021-07-05', '2021-08-05', '2021-08-20');
insert into cierre values(2021, 07, 6, '2021-07-06', '2021-08-06', '2021-08-21');
insert into cierre values(2021, 07, 7, '2021-07-07', '2021-08-07', '2021-08-22');
insert into cierre values(2021, 07, 8, '2021-07-08', '2021-08-08', '2021-08-23');
insert into cierre values(2021, 07, 9, '2021-07-09', '2021-08-09', '2021-08-24');
insert into cierre values(2021, 07, 0, '2021-07-10', '2021-08-10', '2021-08-25');
insert into cierre values(2021, 08, 1, '2021-08-01', '2021-09-01', '2021-09-16');
insert into cierre values(2021, 08, 2, '2021-08-02', '2021-09-02', '2021-09-17');
insert into cierre values(2021, 08, 3, '2021-08-03', '2021-09-03', '2021-09-18');
insert into cierre values(2021, 08, 4, '2021-08-04', '2021-09-04', '2021-09-19');
insert into cierre values(2021, 08, 5, '2021-08-05', '2021-09-05', '2021-09-20');
insert into cierre values(2021, 08, 6, '2021-08-06', '2021-09-06', '2021-09-21');
insert into cierre values(2021, 08, 7, '2021-08-07', '2021-09-07', '2021-09-22');
insert into cierre values(2021, 08, 8, '2021-08-08', '2021-09-08', '2021-09-23');
insert into cierre values(2021, 08, 9, '2021-08-09', '2021-09-09', '2021-09-24');
insert into cierre values(2021, 08, 0, '2021-08-10', '2021-09-10', '2021-09-25');
insert into cierre values(2021, 09, 1, '2021-09-01', '2021-10-01', '2021-10-16');
insert into cierre values(2021, 09, 2, '2021-09-02', '2021-10-02', '2021-10-17');
insert into cierre values(2021, 09, 3, '2021-09-03', '2021-10-03', '2021-10-18');
insert into cierre values(2021, 09, 4, '2021-09-04', '2021-10-04', '2021-10-19');
insert into cierre values(2021, 09, 5, '2021-09-05', '2021-10-05', '2021-10-20');
insert into cierre values(2021, 09, 6, '2021-09-06', '2021-10-06', '2021-10-22');
insert into cierre values(2021, 09, 7, '2021-09-07', '2021-10-07', '2021-10-23');
insert into cierre values(2021, 09, 8, '2021-09-08', '2021-10-08', '2021-10-23');
insert into cierre values(2021, 09, 9, '2021-09-09', '2021-10-09', '2021-10-24');
insert into cierre values(2021, 09, 0, '2021-09-10', '2021-10-10', '2021-10-25');
insert into cierre values(2021, 10, 1, '2021-10-01', '2021-11-01', '2021-11-16');
insert into cierre values(2021, 10, 2, '2021-10-02', '2021-11-02', '2021-11-17');
insert into cierre values(2021, 10, 3, '2021-10-03', '2021-11-03', '2021-11-18');
insert into cierre values(2021, 10, 4, '2021-10-04', '2021-11-04', '2021-11-19');
insert into cierre values(2021, 10, 5, '2021-10-05', '2021-11-05', '2021-11-20');
insert into cierre values(2021, 10, 6, '2021-10-06', '2021-11-06', '2021-11-21');
insert into cierre values(2021, 10, 7, '2021-10-07', '2021-11-07', '2021-11-22');
insert into cierre values(2021, 10, 8, '2021-10-08', '2021-11-08', '2021-11-23');
insert into cierre values(2021, 10, 9, '2021-10-09', '2021-11-09', '2021-11-24');
insert into cierre values(2021, 10, 0, '2021-10-10', '2021-11-10', '2021-11-25');
insert into cierre values(2021, 11, 1, '2021-11-01', '2021-12-01', '2021-12-16');
insert into cierre values(2021, 11, 2, '2021-11-02', '2021-12-02', '2021-12-17');
insert into cierre values(2021, 11, 3, '2021-11-03', '2021-12-03', '2021-12-18');
insert into cierre values(2021, 11, 4, '2021-11-04', '2021-12-04', '2021-12-19');
insert into cierre values(2021, 11, 5, '2021-11-05', '2021-12-05', '2021-12-20');
insert into cierre values(2021, 11, 6, '2021-11-06', '2021-12-06', '2021-12-21');
insert into cierre values(2021, 11, 7, '2021-11-07', '2021-12-07', '2021-12-22');
insert into cierre values(2021, 11, 8, '2021-11-08', '2021-12-08', '2021-12-23');
insert into cierre values(2021, 11, 9, '2021-11-09', '2021-12-09', '2021-12-24');
insert into cierre values(2021, 11, 0, '2021-11-10', '2021-12-10', '2021-12-25');
insert into cierre values(2021, 12, 1, '2021-12-01', '2022-01-01', '2022-01-16');
insert into cierre values(2021, 12, 2, '2021-12-02', '2022-01-02', '2022-01-17');
insert into cierre values(2021, 12, 3, '2021-12-03', '2022-01-03', '2022-01-18');
insert into cierre values(2021, 12, 4, '2021-12-04', '2022-01-04', '2022-01-19');
insert into cierre values(2021, 12, 5, '2021-12-05', '2022-01-05', '2022-01-20');
insert into cierre values(2021, 12, 6, '2021-12-06', '2022-01-06', '2022-01-21');
insert into cierre values(2021, 12, 7, '2021-12-07', '2022-01-07', '2022-01-22');
insert into cierre values(2021, 12, 8, '2021-12-08', '2022-01-08', '2022-01-23');
insert into cierre values(2021, 12, 9, '2021-12-09', '2022-01-09', '2022-01-24');
insert into cierre values(2021, 12, 0, '2021-12-10', '2022-01-10', '2022-01-25');

alter table cierre add constraint cierreaño_pk primary key(año,mes,terminacion);
--alter table cierre add constraint cierremes_pk primary key(mes);
--alter table cierre add constraint cierreterminacion_pk primary key(terminacion);

----------------------------------------------------------------

create table cabecera(nroresumen int, nombre text, apellicdo text, domicilio text, nrotarjeta char(16), desde date, hasta date, vence date, total decimal(8,2));


alter table cabecera add constraint cabecera_pk primary key(nroresumen);
alter table cabecera add constraint cabecera_fk foreign key(nrotarjeta) references tarjeta(nrotarjeta);

----------------------------------------------------------------

create table detalle(nroresumen int, nrolinea int, fecha date, nombrecomercio text, monto decimal(7,2));


alter table detalle add constraint detalle_pk primary key(nrolinea);
alter table detalle add constraint detalle_fk foreign key(nroresumen) references cabecera(nroresumen);

----------------------------------------------------------------

create table alerta(nroalerta serial, nrotarjeta char(16), fecha timestamp, nrorechazo int, codalerta int, descripcion text);

alter table alerta add constraint alerta_pk primary key(nroalerta);
alter table alerta add constraint alerta_fk foreign key(nrotarjeta) references tarjeta(nrotarjeta);

----------------------------------------------------------------

create table consumosvirtuales(nrotarjeta char(16), codseguridad char(4), nrocomercio int , monto decimal (7,2));

alter table consumosVirtuales add constraint consumosvirtualestarjeta_fk foreign key(nrotarjeta) references tarjeta(nrotarjeta);
alter table consumosVirtuales add constraint consumosvirtualescomercio_fk foreign key(nrocomercio) references comercio(nrocomercio);

insert into consumosVirtuales values(5433106642764443, 3418, 1, 1200.00);
insert into consumosVirtuales values(4716158452535062, 6490, 2,  500.00);

insert into consumosVirtuales values(4916984881290831, 2381, 3, 1.00 );
insert into consumosVirtuales values(4916984881290831, 2381, 3, 3.00 );

insert into consumosVirtuales values(4916984881290831, 2381, 7, 2.00 );

insert into consumosVirtuales values(5147940594640906, 4479, 4, 15500.00);

insert into consumosVirtuales values(4716784434325243, 4549, 5, 21000.00);
insert into consumosVirtuales values(4716784434325243, 4549, 6, 2100.00);

insert into consumosVirtuales values(4539303610051842, 3071, 6, 80.00);
insert into consumosVirtuales values(5431767880175981, 7562, 7, 7500.00);
insert into consumosVirtuales values(5218432545801563, 0672, 8, 899.99);
insert into consumosVirtuales values(5242585157876901, 9847, 9, 2350.00);

insert into consumosVirtuales values(8193402929303759, 4677, 10, 670.00);
insert into consumosVirtuales values(8193402929303759, 4677, 13,600.55);



--AUTORIZAR COMPRA
create or replace function autorizarCompra(nrotarjeta_buscado char(16), codseguridad_buscado char(4), nrocomercio_buscado int, monto_ingresado decimal(7,2)) returns boolean as $$
declare	 
	resultado record;   	 
	monto_pendiente float;   	 
	v record;   	 
	fecha_expiracion char(6);

begin		 	
	monto_pendiente := 0;	 	
	fecha_expiracion := 211115; 	   		 	
	select * into resultado from tarjeta where nrotarjeta = nrotarjeta_buscado and estado = 'vigente';				 		
	if not found then   				 			
		raise notice 'tarjeta no valida o no vigente';   		 		 			
		insert into rechazo values (default, nrotarjeta_buscado, nrocomercio_buscado, current_timestamp, monto_ingresado, 'tarjeta no valida o no vigente');   	
		return false;	 		

	elsif resultado.codseguridad != codseguridad_buscado then   
		raise notice 'codigo de seguridad invalido'; 	 	  		
		insert into rechazo values (default, nrotarjeta_buscado, nrocomercio_buscado, current_timestamp, monto_ingresado, 'codigo de seguridad invalido');		 	 
		return false;			

	for v in select * from compra where nrotarjeta = resultado.nrotarjeta and pagado = false loop 				
		monto_pendiente := monto_pendiente + v.monto; 		 			
	end loop;			

	elsif monto_pendiente + monto_ingresado > resultado.limitecompra then			 	
		raise notice 'Supera limite de tarjeta'; 	   					 	
		insert into rechazo values (default, nrotarjeta_buscado, nrocomercio_buscado, current_timestamp, monto_ingresado, 'Supera limite de tarjeta');
	 return false;			

	elsif resultado.estado = 'suspendida' then							 
		raise notice 'La tarjeta se encuentra suspendida'; 	   				 
		insert into rechazo values (default, nrotarjeta_buscado, nrocomercio_buscado, current_timestamp, monto_ingresado, 'La tarjeta se encuentra suspendida');			
		return false;						

	elsif resultado.validahasta > fecha_expiracion then			 	 
		raise notice 'Plazo de vigencia expirado'; 	 		  		 
		insert into rechazo values (default, nrotarjeta_buscado, nrocomercio_buscado, current_timestamp, monto_ingresado, 'Plazo de vigencia expirado');		
	 	return false; 	   						 	 
	else    		 		 	 	
		insert into compra values(default , nrotarjeta_buscado, nrocomercio_buscado, current_timestamp, monto_ingresado, false);   			 	
	 	return true;   		 			 	 	
	end if;
end;	   	
$$ language plpgsql;

--CONSUMOS
create or replace function Autorizar() returns void as $$
declare
	v record;
begin 
	for v in select * from consumosVirtuales loop		
		PERFORM autorizarCompra(v.nrotarjeta, v.codseguridad, v.nrocomercio, v.monto);
	end loop;

end;
$$ language plpgsql;

create or replace function generacionResumen(nro_cliente int, periodo int) returns void as $$			
declare				

	cliente RECORD;				
	cierre RECORD;				
	resumen RECORD;					
	resumenCreado RECORD;				
	tarjeta RECORD;				
	compra RECORD;				
	comercio RECORD;				
	idResumen int;				
	terminacionTarjeta int;				
	compraTotal decimal;				
	nroLinea int;			

begin				

	select * into cliente from cliente where nrocliente = nro_cliente;				
	if not found then					
		raise 'el cliente % es invalido', nro_cliente;				
	end if;							

	select * into resumen from cabecera order by nroresumen desc limit 1;				
	if not found then					
		idResumen := 1;				
	else					
		idResumen := resumen.nroresumen +1;				
	end if;								

	for tarjeta in select * from tarjeta where nrocliente = nro_cliente loop					
		select right (tarjeta.nrotarjeta, 1) into terminacionTarjeta;

		select * into cierre from cierre where mes = periodo and anio = 2021 and terminacion = terminacionTarjeta;					
		if not found then 						
			raise 'No existe cierre para ese periodo';					
		end if;										

		select * into resumenCreado from cabecera where nrotarjeta = tarjeta.nrotarjeta and vence = cierre.fechavto;
		if not found then						
			insert into cabecera values(idResumen, cliente.nombre, cliente.apellido, cliente.domicilio, tarjeta.nrotarjeta, cierre.fechainicio, cierre.fechacierre, cierre.fechavto,0);		
		else						
			raise notice 'Ya existe resumen creado para la tarjeta %', tarjeta.nrotarjeta;						
			continue;					
		end if;																		

		nroLinea := 1;					
		compraTotal := 0;					
		for compra in select * from compra where nrotarjeta = tarjeta.nrotarjeta and fecha <= cierre.fechacierre and fecha >= cierre.fechainicio loop						
			select * into comercio from comercio where nrocomercio = compra.nrocomercio;									
			insert into detalle values (idResumen, nroLinea, compra.fecha, comercio.nombre, compra.monto);	
																		
			nroLinea := nroLinea + 1;						
			compraTotal := compraTotal + compra.monto;					
	
		end loop;									

	update cabecera set total = compraTotal where nroresumen = idResumen;					
	idResumen := idResumen + 1;					

	end loop;			
end;			
$$ language plpgsql;
					
create or replace function rechazo() returns trigger as $$
declare
begin
	insert into alerta values(default, new.nrotarjeta, current_timestamp, new.nrorechazo, 0, new.motivo);
	return new;

end;
$$ language plpgsql;

create trigger rechazo_trg
after update or insert on rechazo
for each row
execute procedure rechazo();


create or replace function dosCompras1min() returns trigger as $$
declare 
	i char(16);
begin 
	select into i nrotarjeta from compra c1 where exists(select nrotarjeta from compra c2 where c1.nrotarjeta=c2.nrotarjeta group by nrotarjeta having count(*)>=2
	and exists (select codigopostal from comercio p1 where exists(select codigopostal from comercio p2 where p1.codigopostal=p2.codigopostal group by codigopostal having count(*)>=2)));
	if found then 
		insert into alerta values(default, i, current_timestamp, null, 1, 'dos compras en menos de 1 minuto');
	end if;
	return new;
end;
$$ language plpgsql;

create trigger dosCompras1min_trg 
after update or insert on compra
for each row
execute procedure dosCompras1min();



create or replace function dosCompras5min() returns trigger as $$
declare
	 v char(16);
begin
		 select into v nrotarjeta from compra c1 where exists(select nrotarjeta from compra c2 where c1.nrotarjeta=c2.nrotarjeta group by nrotarjeta having count(*)>=2)
		 and exists (select distinct(codigopostal) from comercio group by codigopostal);
		 if found then
			 insert into alerta values(default, v, current_timestamp, null, 5, 'dos compras en menos de 5 minuto');
		end if;
	 return new;
end;
$$ language plpgsql;
 
create trigger dosCompras5min_trg
after update or insert on compra
for each row
execute procedure dosCompras5min();



create or replace function dosrechazos() returns trigger as $$
declare
	r char(16);
begin
	 select into r nrotarjeta from rechazo r1 where exists(select nrotarjeta from rechazo r2 where r1.nrotarjeta=r2.nrotarjeta group by nrotarjeta having count(*)>=2)
	 and exists (select motivo from rechazo p1 where exists(select motivo from rechazo p2 where p1.motivo=p2.motivo group by motivo having count(*)>=2));
	 if found then
		 insert into alerta values(default, r, current_timestamp, null, 32, 'exceso de limite 2 veces');
	 end if;
	 return new;
end;
$$ language plpgsql;

create trigger dosRechazos_trg
after update or insert on rechazo
for each row
execute procedure dosrechazos();
