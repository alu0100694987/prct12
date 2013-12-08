# Fichero en el que se definen las espectativas de la clase Matriz

require 'matrices.rb'

describe Matriz do

  before :all do
    @m1 = Matriz.nula # Dispersa
    @m2 = Matriz.nula(3,2) # Dispersa
    @m3 = Matriz.vector(3,2,[2,3,0,1,0,3]) # Densa
    @m4 = Matriz.vector(2,4,[0,1,0,0,7,0,2,0]) # Dispersa
    @m5 = Matriz.vector(4,4,[1,1,5,1,2,1,6,1,1,5,1,3,1,2,1,1]) # Densa
    @m6 = Matriz.vector(2,2,[Fraccion.new(1),Fraccion.new(1,5),Fraccion.new(0),Fraccion.new(1,3)]) # Densa
    @m7 = Matriz.vector(1,3,[Fraccion.new(0),Fraccion.new(0),Fraccion.new(4)]) # Dispersa
    @m8 = Matriz.vector(1,2,[Fraccion.new(1,2),Fraccion.new(3,2)]) # Densa
  end
  
  describe "# Asignacion correcta del tipo de matriz: " do
    it "Identificacion de Matriz.nula como Matriz_dispersa" do
      @m1.class.should eq(Matriz_dispersa)
      @m2.class.should eq(Matriz_dispersa)
    end
    it "Identificacion de Matriz.vector como Matriz_dispersa o Matriz.vector en funcion del numero de ceros" do
      @m3.class.should eq(Matriz_densa)
      @m4.class.should eq(Matriz_dispersa)
    end
    it "Identificacion de matrices de fracciones como Matriz_dispersa y Matriz_nula" do
      @m6.class.should eq(Matriz_densa)
      @m7.class.should eq(Matriz_dispersa)
    end
  end  
  
  describe "# Almacenamiento de numero de filas y columnas: " do
    it "Almacenamiento correcto del numero de filas en matrices densas" do
      @m3.rows.should eq(3)
      @m5.rows.should eq(4)
    end
    it "Almacenamiento correcto del numero de filas en matrices dispersas" do
      @m1.rows.should eq(1)
      @m4.rows.should eq(2)
    end
    it "Almacenamiento correcto del numero de columnas en matrices densas" do
      @m3.cols.should eq(2)
      @m5.cols.should eq(4)
    end
    it "Almacenamiento correcto del numero de columnas en matrices dispersas" do
      @m1.cols.should eq(1)
      @m4.cols.should eq(4)
    end
    it "Almacenamiento correcto del numero de filas y columnas en matrices de fracciones" do
      @m7.rows.should eq(1)
      @m7.cols.should eq(3)
    end
  end
  
  describe "# Correcta conversion a cadena de caracteres: " do
    it "Funcionamiento correcto del metodo to_s en matrices densas" do
      @m3.to_s.should eq('[[2,3],[0,1],[0,3]]')
      @m5.to_s.should eq('[[1,1,5,1],[2,1,6,1],[1,5,1,3],[1,2,1,1]]')
    end
    it "Funcionamiento correcto del metodo to_s en matrices dispersas" do
      @m1.to_s.should eq('[[0]]')
      @m4.to_s.should eq('[[0,1,0,0],[7,0,2,0]]')
    end
    it "Funcionamiento correcto del metodo to_s en matrices densas y dispersas de fracciones" do
      @m6.to_s.should eq('[[1/1,1/5],[0,1/3]]')
      @m7.to_s.should eq('[[0,0,4/1]]')
    end
  end
  
  describe "# Acceso a los elementos de la matriz: " do
    it "Insercion correcta de elementos en matrices densas y dispersas" do
      @m2[0,0]= 1; @m2[0,1]= 1
      @m2[1,0]= 1; @m2[1,1]= 1
      @m2[2,0]= 1; @m2[2,1]= 1
      @m3[2,0]= 5
      @m2.to_s.should eq('[[1,1],[1,1],[1,1]]')    
      @m3.to_s.should eq('[[2,3],[0,1],[5,3]]')
    end
    it "Obtencion correcta de elementos en matrices densas y dispersas" do
      @m4[1,0].should eq(7)
      @m5[1,2].should eq(6)
    end
    it "Insercion y obtencion correcta de elementos en matrices de fracciones" do
      @m7[0,2]= Fraccion.new(1,2)
      @m7[0,2].to_s.should eq('1/2')
    end
  end
  
  describe "# Operaciones aritmeticas: " do
    it "Suma de matrices" do
      (@m2 + @m3).to_s.should eq('[[3,4],[1,2],[6,4]]')
    end
    it "Resta de matrices" do
      (@m3 - @m3).to_s.should eq('[[0,0],[0,0],[0,0]]')
    end
    it "Multiplicacion por escalar" do
      (2 * @m3).to_s.should eq('[[4,6],[0,2],[10,6]]')
    end
    it "Multiplicacion de matrices" do
      (@m3 * @m4).to_s.should eq('[[21,2,6,0],[7,0,2,0],[21,5,6,0]]')
    end
    it "Comprobacion del tipo de clase del resultado de las operaciones" do
      (@m2 + @m3).class.should eq(Matriz_densa)
      (@m2 - @m2).class.should eq(Matriz_dispersa)
      (@m3 * @m4).class.should eq(Matriz_densa)
    end
    it "Operaciones con matrices que contienen alguna fraccion" do
      (@m6 + @m6).to_s.should eq('[[2/1,2/5],[0,2/3]]')
      (@m8 * @m6).to_s.should eq('[[1/2,3/5]]')
    end
  end
  
  describe "# Comparacion de matrices: " do
    it "Igualdad de matrices" do
      (@m5 == Matriz.vector(4,4,[1,1,5,1,2,1,6,1,1,5,1,3,1,2,1,1])).should be_true
      (@m1 == Matriz.nula(5,2)).should be_false
    end
    it "Igualdad de matrices de fracciones" do
      (@m6 == Matriz.vector(2,2,[Fraccion.new(1),Fraccion.new(1,5),Fraccion.new(0),Fraccion.new(1,3)])).should be_true
      (@m6 == Matriz.vector(2,2,[1,Fraccion.new(1,5),0,Fraccion.new(1,3)])).should be_true
    end
  end
  
  describe "# Calculo del minimo y el maximo de los elementos de una matriz" do
    it "Obtencion del minimo de una matriz" do
      @m4.min.should eq(Fraccion.new(0))
      @m5.min.should eq(1)
      @m6.min.should eq(0)
      @m8.min.should eq(Fraccion.new(1,2))
    end
    it "Obtencion del maximo de una matriz" do
      @m4.max.should eq(7)
      @m5.max.should eq(6)
      @m6.max.should eq(1)
      @m7.max.should eq(Fraccion.new(1,2))
    end
  end

end