Cristo González Rodríguez | Juvenal Santiso Hernández

Grupo 07 - Turno de mañana

====> Práctica 9 <====

 -> Repositorio Inicial

  - Fichero "Rake", con las tareas de ayuda de Bundler, preparado para poder trabajar con la herramienta de integración continua "Travis".
  - Fichero ".travis.yml" con las versiones/implementaciones de Ruby en las que se va a testear.
  - Fichero "Gemfile" que controla las dependencias de las gemas utilizadas (gestionadas a través del fichero con extension ".gemspec").
  - Fichero "Guardfile" para trabajar con la herramienta de comprobación continua "Guard".
  - Fichero "matrices.gemspec", plantilla para la creación de nuestra gema, con la información requerida, y las dependencias de gemas para "Gemfile".

  - Se incluyen los ficheros "lib/fraccion.rb", "lib/mcd.rb", "lib/matrices.rb" (anterior clase Matriz), que contienen las implementaciones de las anteriores prácticas.
  - Se incluyen los ficheros de definición de espectativas "spec/fraccion_spec.rb" (para "fraccion.rb"), y "spec/matrices_spec.rb" (para "matrices.rb"), con las espectativas para la antigua clase Matriz.
  - Se incluye el fichero "tc_matrices.rb" vacío, para la posterior definición de pruebas unitarias.

 -> Definición de espectativas "spec/fraccion_spec.rb"
 
  - Se definen las espectativas para la creación de matrices dispersas y densas, y la realización de operaciones con las mismas.
 
 -> Creando el código
    
  - Se plantea la jerarquía de herencia de la clase matriz, esta se ha planteado que se creara dos clases hijas de matriz.rb matriz_dispersa.rb y matriz_densa.rb. Todos los métodos de operadores se han definido en la clase madre; en las clases hijas en lo que se ha querido hacer incapié es en el modo de almacenar cada una y por consiguiente tendrá metodos de acceso distintos, por esto de definió el método [] y []= de nuevo en la matriz dispersa.

 -> Añadiendo los Test Case
 
  - Se definen los test para la revisión de los métodos de la clase.

 -> Definición de espectativas para matrices que puedan contener fracciones

  - Se definen las espectativas para trabajar con matrices densas y disperas, y se modifica levemente la implementación para su correcto funcionamiento.

 -> Definición de espectativas de utilización de métodos "max" y "min"

  - Se definen las espectativas para el cálculo de los valores máximos y mínimos de una matriz, con las funciones "max" y "min" respectivamente.

 -> Implementación métodos "max" y "min", y creación de pruebas

  - Se satisfacen las espectativas para el cálculo de los elementos máximos y mínimos de una matriz, mediante la creación de los métodos "max" y "min", en la clase abstracta Matriz
  - Se añaden al fichero "test/tc_matrices.rb", los test necesarios para comprobar el correcto funcionamiento de dichos métodos.

 -> Creación de la gema: "pkg/matrices-0.0.1.gem"
 
  - Se crea la gema con la tarea 'rake build'.
  - Se modifica el fichero ".gitignore" para poder subir el contenido del directorio "pkg" y los ficheros acabados en ".gem" (ignorados por defecto), al repositorio.
  - Publicación de la gema: "https://rubygems.org/gems/matrices".
 