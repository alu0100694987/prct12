require 'matrices/fraccion.rb'

describe Fraccion do
  
  before :each do
    @frac1 = Fraccion.new(3,4)
    @frac2 = Fraccion.new(4,10)
    @frac3 = Fraccion.new(2,-5)
  end
  
  describe "# Numerador y denominador: " do
    it "Almacenamiento correcto de numerador" do
      @frac1.n.should eq(3)
    end
    it "Almacenamiento correcto de denominador" do
      @frac1.d.should eq(4)
    end
    it "Almacenamiento reducido de numerador" do
      @frac2.n.should eq(2)
    end
    it "Almacenamiento reducido de denominador" do
      @frac2.d.should eq(5)
    end  
  end
  
  describe "# Metodos num() y denom(): " do
    it "Obtencion de numerador" do
      @frac1.num().should == 3
    end
    it "Obtencion de denominador" do
      @frac2.denom().should == 5
    end
  end
  
  describe "# Salida en consola: " do
    it "Mostrar fraccion en pantalla" do
      @frac1.to_s().should == "3/4"
      @frac2.to_s().should == "2/5"
    end
    it "Mostrar fraccion en formato flotante" do
      @frac1.to_f().to_s().should eq("0.75")
      @frac2.to_f().to_s().should eq("0.4")
    end
  end
  
  describe "# Igualdad de fracciones:" do
    it "Comparar si dos fracciones son iguales" do
      (@frac1 == Fraccion.new(4)).should be_false
      (@frac1 == Fraccion.new(6,8)).should be_true
    end
  end
  
  describe "# Operaciones unarias:" do
    it "Calculo del valor absoluto" do
      @frac1.abs.should == @frac1
      @frac3.abs.to_s().should eq("2/5")
    end
    it "Calculo del reciproco" do
      @frac1.reciprocal.to_s().should eq("4/3")
      @frac3.reciprocal.to_s().should eq("-5/2")
    end
    it "Calculo del opuesto" do
      ((-@frac1) == @frac1).should be_false
      (-@frac3).to_s.should eq("2/5")
    end
  end
  
  describe "# Operaciones binarias:" do
    
    it "Suma de fracciones" do
      (@frac1 + @frac2).to_s().should eq("23/20")
      ((@frac2 + @frac3) == Fraccion.new(0)).should be_true
    end

    it "Diferencia de fracciones" do
      (@frac1 - @frac2).to_s().should eq("7/20")
      (@frac3 - @frac2).to_s().should eq("-4/5")
    end
    
    it "Producto de fracciones" do
      ((@frac1 * @frac2) == Fraccion.new(3,10)).should be_true
      ((@frac2 * @frac3) == Fraccion.new(-4,25)).should be_true
    end

    it "Division de fracciones" do
      ((@frac1 / @frac2) == Fraccion.new(15,8)).should be_true
      ((@frac3 / @frac3) == Fraccion.new(1,1)).should be_true
    end     

    it "Resto entre fracciones" do
      ((@frac1 % @frac2) == Fraccion.new(7,20)).should be_true
      ((@frac2 % @frac3) == Fraccion.new(0,1)).should be_true
    end
    
  end


  describe "# Comparaciones entre fracciones:" do
     it "Comparacion mayor, y mayor e igual" do
       (@frac1 >= @frac2).should be_true
       (@frac1 > @frac1).should be_false
     end
     it "Comparacion menor, y menor e igual" do
       (@frac2 <= @frac2).should be_true
       (@frac2 < @frac3).should be_false
     end
  end

end