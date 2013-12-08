# Pruebas unitarias asociadas a la creacion de matrices

require 'lib/matrices.rb'
require 'test/unit'

class Test_Matrices < Test::Unit::TestCase

  def setup
    @m1=Matriz.vector(2,2,[0,1,1,0])
    @m2=Matriz.vector(2,2,[1,1,1,1])
    @m3=Matriz.nula
    @m4=Matriz.vector(2,2,[0,0,0,5])
    @m5=Matriz.vector(2,2,[1,1,1,1])
    @m6=Matriz.vector(2,2,[1,2,3,4])
  end
  
  def tear_down
    #nothing
  end
  
  #to_s
  def test_str
    assert_equal(@m3.to_s,'[[0]]')
    assert_equal(@m2.to_s,'[[1,1],[1,1]]')
  end
  
  #Comprobacion de la creacion de matrices
  def test_creac
    #Matriz densa
    assert_equal(@m1.rows, 2)
    assert_equal(@m1.cols, 2)
    
    #Matriz dispersa
    assert_equal(@m4.rows, 2)
    assert_equal(@m4.cols, 2)
    
    #Creacion
    assert_equal(Matriz.vector(2,2,[1,1,1,1]).to_s,@m2.to_s)
    assert_equal(Matriz.nula.to_s,@m3.to_s)
  end
  
  #Comprobacion del tipo de las matrices creadas
  
  def test_tipo
    assert_kind_of(Matriz_dispersa, @m3)
    assert_kind_of(Matriz_dispersa, @m4) #Matriz.vector siendo clase dispersa 
    assert_kind_of(Matriz_densa, @m2)
  end
  
  #Comprobacion de las operaciones 
  def test_method
    #==
    assert_operator(@m2,'==',@m5)
    #max y min
    assert_equal(5,@m4.max)
    assert_equal(4,@m6.max)
    assert_equal(1,@m6.min)
    #Operaciones
    assert_equal(Matriz.vector(2,2,[1,2,2,1]).to_s,(@m1+@m2).to_s)
    assert_equal(Matriz.vector(2,2,[1,0,0,1]).to_s,(@m2-@m1).to_s)
    assert_equal(Matriz.vector(2,2,[1,1,1,1]).to_s,(@m1*@m2).to_s)
    assert_equal(Matriz.vector(2,2,[2,2,2,2]).to_s,(@m2*2).to_s)
  end  

  #Insercion y obtencion del contenido
  def test_cont
    @m4[0,0]=1
    @m1[0,0]=1
    #insercion
    assert_equal(@m4.to_s,'[[1,0],[0,5]]')
    assert_equal(@m1.to_s,'[[1,1],[1,0]]')
    #obtencion
    assert_equal(@m4[1,1],5)
    assert_equal(@m1[0,0],1)
  end
  
  #test de fallo 
  def test_failure
    assert_equal(Matriz.vector(2,2,[5,1,0,2]).to_s,(@m1+@m2).to_s)
  end
end
