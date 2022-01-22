package main

import (
	"encoding/json"
	"fmt"    
	bolt "go.etcd.io/bbolt"    
	"log"    
	"strconv"
	_"github.com/lib/pq"
	"time"
)

func main(){
	    db, err := bolt.Open("bbdd.db", 0600, nil)    
	    	if err != nil {        
	    		log.Fatal(err)   
	     }
	    
	    	defer db.Close()			

	tarj_1 := Tarjeta{"5433106642764443", 1, "202007", "202107", 3419, 120000.00, "suspendida"}	
	tarj_2 := Tarjeta{"5265789653478240", 13, "202912", "213011", 0132, 67890.00, "vigente"}		
	tarj_3 := Tarjeta{"8193402929303759", 18, "170901", "220718", 4677, 60590.00, "vigente"}

	tarj_1_JSON, err := json.Marshal(tarj_1)		
	if err != nil {				
	log.Fatal(err)		
}

	tarj_2_JSON, err := json.Marshal(tarj_2)		
	if err != nil {				
	log.Fatal(err)		
}

	tarj_3_JSON, err := json.Marshal(tarj_3)
	if err != nil {				
	log.Fatal(err)	
}

			comercio_1 := Comercio{10, "Prater Bar", "Rodriguez Pena 1399", "B1712JQM", "11-4627-0772"}		
			comercio_2 := Comercio{16, "YPF", "Av. Pte Arturo Umberto Illia 2604", "B1754KJV", "11-7422-7068"}		
			comercio_3 := Comercio{7, "McDonals", "Av. Pte. J. D. Peron 1522", "B1664GFK", "11-2401-0679"}
		
		
			Comercio_1_JSON, err := json.Marshal(comercio_1)		
			if err != nil {				
			log.Fatal(err)	
		}
		
			Comercio_2_JSON, err := json.Marshal(comercio_2)		
			if err != nil {				
			log.Fatal(err)	
		}	
		
			Comercio_3_JSON, err := json.Marshal(comercio_3)		
			if err != nil {
			log.Fatal(err)
		}
			
		compra_1 := Compra{1, tarj_1.Nrotarjeta, comercio_1.Nrocomercio, time.Now(), 2500.0, false}		
		compra_2 := Compra{2, tarj_2.Nrotarjeta, comercio_2.Nrocomercio,time.Now() , 1050.0, true}		
		compra_3 := Compra{3, tarj_3.Nrotarjeta, comercio_3.Nrocomercio, time.Now(), 6470.0, false}
	
		Compra_1_JSON, err := json.Marshal(compra_1)		
		if err != nil {				
		log.Fatal(err)		
	}
	
		Compra_2_JSON, err := json.Marshal(compra_2)		
		if err != nil {				
		log.Fatal(err)		
	}
	
		Compra_3_JSON, err := json.Marshal(compra_3)		
		if err != nil {				
		log.Fatal(err)		
	}

		cliente_1 := Cliente{1, "Losa", "Pastor", "Ingeniero Agustin Rosas 95", "11-5487-9827"}
		cliente_2 := Cliente{2, "Celestina", "Lobo", "Av Rivadavia 1391", "11-9159-7968"}
		cliente_3 := Cliente{3, "Belen", "Torre", "San Miguel", "11-0243-8815"}

		Cliente_1_JSON, err := json.Marshal(cliente_1)
		if err != nil{
		log.Fatal(err)	
		}	

		Cliente_2_JSON, err := json.Marshal(cliente_2)
		if err != nil{
		log.Fatal(err)	
		}

		Cliente_3_JSON, err := json.Marshal(cliente_3)
		if err != nil{
		log.Fatal(err)	
		}	
						
				
		
	CreateUpdate(db, "tarjeta", []byte(tarj_1.Nrotarjeta), tarj_1_JSON)		
	CreateUpdate(db, "tarjeta", []byte(tarj_2.Nrotarjeta), tarj_2_JSON)		
	CreateUpdate(db, "tarjeta", []byte(tarj_3.Nrotarjeta), tarj_3_JSON)	

	T1, err := ReadUnique(db, "tarjeta", []byte(tarj_1.Nrotarjeta))	
	T2, err := ReadUnique(db, "tarjeta", []byte(tarj_2.Nrotarjeta))	
	T3, err := ReadUnique(db, "tarjeta", []byte(tarj_3.Nrotarjeta))	

	fmt.Printf("%s\n", T1)		
	fmt.Printf("%s\n", T2)		
	fmt.Printf("%s\n", T3)	

	
	CreateUpdate (db, "comercio", []byte(strconv.Itoa(comercio_1.Nrocomercio)), Comercio_1_JSON)		
	CreateUpdate (db, "comercio", []byte(strconv.Itoa(comercio_2.Nrocomercio)), Comercio_2_JSON)
	CreateUpdate (db, "comercio", []byte(strconv.Itoa(comercio_3.Nrocomercio)), Comercio_3_JSON)	

	C1, err := ReadUnique(db, "comercio", []byte(strconv.Itoa(comercio_1.Nrocomercio)))
	C2, err := ReadUnique(db, "comercio", []byte(strconv.Itoa(comercio_2.Nrocomercio)))		
	C3, err := ReadUnique(db, "comercio", []byte(strconv.Itoa(comercio_3.Nrocomercio)))

	fmt.Printf("%s\n", C1)		
	fmt.Printf("%s\n", C2)		
	fmt.Printf("%s\n", C3)	

	
	CreateUpdate(db, "compra", []byte(strconv.Itoa(compra_1.Nrooperacion)), Compra_1_JSON)		
	CreateUpdate(db, "compra", []byte(strconv.Itoa(compra_2.Nrooperacion)), Compra_2_JSON)		
	CreateUpdate(db, "compra", []byte(strconv.Itoa(compra_3.Nrooperacion)), Compra_3_JSON)	

	Compra1, err := ReadUnique(db, "compra", []byte(strconv.Itoa(compra_1.Nrooperacion)))		
	Compra2, err := ReadUnique(db, "compra", []byte(strconv.Itoa(compra_2.Nrooperacion)))		
	Compra3, err := ReadUnique(db, "compra", []byte(strconv.Itoa(compra_3.Nrooperacion)))

	fmt.Printf("%s\n", Compra1)		
	fmt.Printf("%s\n", Compra2)		
	fmt.Printf("%s\n", Compra3)


	CreateUpdate(db, "cliente", []byte(strconv.Itoa(cliente_1.Nrocliente)), Cliente_1_JSON)		
	CreateUpdate(db, "cliente", []byte(strconv.Itoa(cliente_2.Nrocliente)), Cliente_2_JSON)		
	CreateUpdate(db, "cliente", []byte(strconv.Itoa(cliente_3.Nrocliente)), Cliente_3_JSON)

	Cliente1, err := ReadUnique(db, "cliente", []byte(strconv.Itoa(cliente_1.Nrocliente)))		
	Cliente2, err := ReadUnique(db, "cliente", []byte(strconv.Itoa(cliente_2.Nrocliente)))		
	Cliente3, err := ReadUnique(db, "cliente", []byte(strconv.Itoa(cliente_3.Nrocliente)))

	
	fmt.Printf("%s\n", Cliente1)		
	fmt.Printf("%s\n", Cliente2)		
	fmt.Printf("%s\n", Cliente3)	
}

	
// }

type Tarjeta struct{
	Nrotarjeta string			
	Nrocliente int			
	Validadesde string			
	Validahasta string			
	Codseguridad int			
	Limitecompra float64			
	Estado string	
}

type Comercio struct {
	Nrocomercio int			
	Nombre string			
	Domicilio string			
	Codigopostal string			
	Telefono string
}

type Compra struct {		
	Nrooperacion int	
	Nrotarjeta string			
	Nrocomercio int			
	Fecha time.Time			
	Monto float64			
	Pagado bool
}

type Cliente struct{
	Nrocliente int
	Nombre string
	Apellido string
	Domicilio string
	Telefono string
}



		
func CreateUpdate(db *bolt.DB, bucketName string, key []byte, val []byte) error {   
	 // abre transacción de escritura    
	 tx, err := db.Begin(true)    
	 if err != nil {        
	 	return err    
	 }    
	 defer tx.Rollback()    

	 b, _ := tx.CreateBucketIfNotExists([]byte(bucketName))    

	 err = b.Put(key, val)    
	 if err != nil {        
	 	return err    
	 }    

	 // cierra transacción    

	 if err := tx.Commit(); err != nil {        
	 	return err    
	 	}    
	 	return nil
	 }


func ReadUnique(db *bolt.DB, bucketName string, key []byte) ([]byte, error) {
    var buf []byte   

     // abre una transacción de lectura    
     err := db.View(func(tx *bolt.Tx) error {
         b := tx.Bucket([]byte(bucketName))        
     	  buf = b.Get(key)        
     	  return nil    
     	})    
     	return buf, err
     }
 
