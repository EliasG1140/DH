const archivos = require("./lecturaEscritura");
let ArrayProfesionales = archivos.leerJson("profesionales");

const cartillaProfesionales = {
  
  profesionales: ArrayProfesionales,

  listarProfesional: function(objeto){
    return `ID: ${objeto.identificador}, Nombre: ${objeto.nombre}, Honorarios: ${objeto.honorarioConsulta}, Especialidad: ${objeto.especialidad}.`
  },

  listarProfesionales: function(ArrayObjetos){
    let listado = []
    for (let i = 0; i < ArrayObjetos.length; i++) {
      listado.push(`ID: ${ArrayObjetos[i].identificador}, Nombre: ${ArrayObjetos[i].nombre}, Honorarios: ${ArrayObjetos[i].honorarioConsulta}, Especialidad: ${ArrayObjetos[i].especialidad}.`)      
    }
    return listado
  },
  filtrarHabilitados: function(){
    let habilitados = []
    for (let i = 0; i < this.profesionales.length; i++) {
      if (this.profesionales[i].estaHabilitado == true) {
        habilitados.push(this.profesionales[i])
      }      
    }
    return habilitados;
  },

  buscarPorNombre: function(string){
    for (let i = 0; i < this.profesionales.length; i++) {
      if (this.profesionales[i].nombre == string) {
        return this.profesionales[i];
      }
    }
    return "No se encuentran coincidencias"
  },

  habilitarProfesional: function (string){
    this.buscarPorNombre(string).estaHabilitado = true
    this.guardarCambios()
  },

  //Hasta aquí 
  //Este metodo deberan invocar cada vez que se realice alguna modificacion de una propiedad para persistir los cambios
  guardarCambios: function() {
    archivos.escribirJson("profesionales", this.profesionales);
  },
};

/* - - - - - - - - - - - - - CONSOLE LOG - - - - - - - - - - - - - */
// 1. Obtener lista de ArrayProfesionales

// console.log(ArrayProfesionales) // < - - - - - Le cambie el nombre de la variable por que me confundia

// 2. cartillaProfesionales
// a. propiedad llamada profesionales que contenga los profesionales.

// console.log(cartillaProfesionales.profesionales) 

// b. método listarProfesional ,que reciba un objeto y de un profesional buscado
//console.log(cartillaProfesionales.listarProfesional(ArrayProfesionales[0]))
// EN ESTE CASO, NO QUEDA IGUAL QUE LA AYUDA DEJADA EN EL APRCIAL, PORQUE LE CAMBIE EL NOMBRE A 
// LA VARIABLE POR ArrayProfesionales

// c. listarProfesionales que reciba un Array de objetos y de un listado de los profesionales (2 OPCIONES)
// console.log(cartillaProfesionales.listarProfesionales(ArrayProfesionales));
//console.log(cartillaProfesionales.listarProfesionales(cartillaProfesionales.profesionales));

// d. filtrarHabilitados, filtra los profesionales habilitados
//console.log(cartillaProfesionales.filtrarHabilitados())

// e. buscarPorNombre, busca por nombre como parametro al proesional
//console.log(cartillaProfesionales.buscarPorNombre("Mayra Tran"));
//console.log(cartillaProfesionales.buscarPorNombre("Elias Garcia")); // No esta en la lista

// f. habilitarProfesional, busca por nombre y le da true en estado de habilitado
// Y invoca el parametro o propiedad Guardar cambios
//console.log(cartillaProfesionales.habilitarProfesional("Huber Wilkins")); // Otron Nombre "Pena Landry" con ID 2

// Probar con otro nombre, ya que con este probe y le puse true xD

// Profe, asi o mas prolijo ? Ahi le facilito para mejor calificacion ;)