# Fichero en el que se definen las espectativas de la clase Matriz

require 'matrices.rb'

describe MatrixDSL do

  before :all do
    @m1 = MatrixDSL.new("Suma") do 
      option "densa"
      option "console"
      operand [[1,Fraccion.new(1,2)],[1,1]] 
      operand [[2,2],[Fraccion.new(3,4),2]]
    end
    @m2 = MatrixDSL.new("Resta") do 
      option "dispersa"
      option "console"
      operand [[0,1],[0,1],[0,2],[0,3]] 
      operand [[0,0],[0,5],[-2,0],[5,-1]] 
    end
    @m3 = MatrixDSL.new("Producto") do 
      option "densa"
      option "console"
      operand [[0,1,-2],[1,3,2]] 
      operand [[-1],[3],[2]]
    end
    @m4 = MatrixDSL.new("Suma") do 
      option "dispersa"
      option "file"
      operand [[-2,0,4],[0,0,0]] 
      operand [[1,3,0],[-1,0,0]]
    end
    @texto = ""
    File.open('Matrix.txt', 'r') do |f|
      while linea = f.gets
        @texto << linea
      end
    end
  end
  
  describe "# Representacion correcta del tipo de matriz: " do
    it "Matriz densa" do
      @m1.op[0].class.should eq(Matriz_densa)
      @m1.op[1].class.should eq(Matriz_densa)
    end
    it "Matriz dispersa" do
      @m2.op[0].class.should eq(Matriz_dispersa)
      @m2.op[1].class.should eq(Matriz_dispersa)
    end
  end
  
  describe "# Representación correcta de la operacion (como cadena de caracteres): " do
    it "Matrices densas" do
      @m1.to_s.should eq("\n Suma\n ====\n\n 1. [[1,1/2],[1,1]]\n 2. [[2,2],[3/4,2]]\n  = [[3,5/2],[7/4,3]]\n\n")
      @m3.to_s.should eq("\n Producto\n ========\n\n 1. [[0,1,-2],[1,3,2]]\n 2. [[-1],[3],[2]]\n  = [[-1],[12]]\n\n")
    end
    it "Matrices dispersas" do
      @m2.to_s.should eq("\n Resta\n =====\n\n 1. [[0,1],[0,1],[0,2],[0,3]]\n 2. [[0,0],[0,5],[-2,0],[5,-1]]\n  = [[0,1],[0,-4],[2,2],[-5,4]]\n\n")
      @m4.to_s.should eq("\n Suma\n ====\n\n 1. [[-2,0,4],[0,0,0]]\n 2. [[1,3,0],[-1,0,0]]\n  = [[-1,3,4],[-1,0,0]]\n\n")
    end
  end
  
  describe "# Escritura en fichero correcta: " do
    it "Fichero Matrix.txt" do
      @texto.to_s.should eq("\n Suma\n ====\n\n 1. [[-2,0,4],[0,0,0]]\n 2. [[1,3,0],[-1,0,0]]\n  = [[-1,3,4],[-1,0,0]]\n\n")
    end
  end

end