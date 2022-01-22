package main
//autorizarCompra

import(
	"fmt"
	"log"
)
func AutorizarCompra(){
	
    _, err = db.Query(`create or replace function autorizarCompra(nrotarjeta_buscado char(16), codseguridad_buscado char(4), nrocomercio_buscado int, monto_ingresado decimal(7,2)) returns boolean as $$
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
   	
$$ language plpgsql;`)

	if err != nil{
		log.Fatal(err)
		}
	
}
