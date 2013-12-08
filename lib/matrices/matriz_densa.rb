
class Matriz_densa < Matriz 
  #Getters
  attr_reader :rows, :cols
  
  #Contructor
  def initialize(rows, cols, ele)
    super(rows, cols)
    @mat=Array.new(ele)
    @mat.map! {|e|; if e == e.elemento_nulo; e = 0; else e; end}
  end
  
  #Metodo que simula la posicion de una matriz bidimensional en un vector unidimensional
  def pos(x,y)
    (x*@cols)+y
  end
  
  #Leer elemento
  def [](x,y)
    @mat[pos(x,y)]
  end
  
  #Modificar elemento
  def []=(x,y,value)
    @mat[pos(x,y)] = value
  end 

  #Operador de igualacion de matrices
  def ==(other)
    if (@rows != other.rows || @cols != other.cols)
      return false
    end
    for i in 0...@rows
      for j in 0...@cols
        if (@mat[pos(i,j)] != other[i,j])
          return false
        end
      end
    end
    return true
  end
  
end
