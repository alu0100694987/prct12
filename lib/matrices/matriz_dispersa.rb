
class Matriz_dispersa < Matriz
  #Getters
  attr_reader :rows, :cols
  
  #Constructor
  def initialize(rows, cols, ele)  
    super(rows, cols)
    
    @val, @f, @c = Array.new, Array.new, Array.new

    for i in 0...(@rows*@cols)
      if(ele[i]!=0)
        @val << (ele[i])
        @f << (i/@cols)
        @c << (i%@cols)
      end
    end
  end
  
  #Lectura
  def [](x,y)
    for pos in 0...@val.length
      if (@f[pos] == x && @c[pos] == y)
        return @val[pos]
      end
    end
    0
  end
  
  #Escritura
  def []=(x,y,value)
    for pos in 0...@val.length
      if (@f[pos] == x && @c[pos] == y)
        if (value != 0)
          @val[pos] = value
        else
          @val.delete_at(pos)
          @f.delete_at(pos)
          @c.delete_at(pos)
        end
        return
      end
    end
    if (value != 0)
      @val << value
      @f << x
      @c << y
    end
  end
 
  #Longitud de nuestro vector de elementos
  def length
    @val.length
  end

  #Operador para igualar matrices dispersas
  def ==(other)
    if (@val.length != other.length || @rows != other.rows || @cols != other.cols)
      return false
    end
    for pos in 0...@val.length
      if (@val[pos] != other(@f[pos],@c[pos]))
        return false
      end
    end
    true
  end
  
end
