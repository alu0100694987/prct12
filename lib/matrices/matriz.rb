
class Matriz
  #Declaracion de los getters de los atributos rows y cols
  attr_reader :rows, :cols
  
  #Constructor 
  def initialize(rows, cols)
    @rows, @cols = rows , cols
  end
  
  #Constructores factoria     
  def Matriz.vector(rows, cols, ele)
    raise TypeError, 'No se han introducido suficientes valores' unless (ele.length==rows*cols) 
      if (((ele.count{|e| e == e.elemento_nulo}*100)/(rows*cols)) >= 60) # Matriz dispersa
        Matriz_dispersa.new(rows,cols,ele)
      else # Matriz densa
        Matriz_densa.new(rows,cols,ele)
      end
  end
  
  #Constructor factoria que crea una matriz vacia 
  def Matriz.nula(rows=1, cols=1)
    aux=Array.new(rows*cols, 0)
    Matriz_dispersa.new(rows, cols, aux)
  end
  
  #Funcion to_s para convertir a string el objeto y se pueda mostrar por pantalla     
  def to_s  
    cadena = "["
    for i in (0..(@rows-1))
      cadena += "["
      for j in (0..(@cols-1))
        cadena += "#{self[i,j]}"
        if (j < (@cols-1)) 
          cadena += "," 
        end
      end
      cadena += "]"
      if (i < (@rows-1)) 
        cadena += "," 
      end
    end
    cadena += "]"
  end

  #Suma de matrices
  def +(other) 
    raise TypeError, 'Las matrices no son del mismo tamanyo' unless (@rows==other.rows && @cols==other.cols)
      result=Array.new
      @rows.times do |i|
        @cols.times do |j|
          result << (self[i,j] + other[i,j])
        end
      end
      Matriz.vector(@rows, @cols, result)
  end
  
  #Resta de matrices
  def -(other) 
    raise TypeError, 'Las matrices no son del mismo tamanyo' unless (@rows==other.rows && @cols==other.cols)
      result=Array.new
      @rows.times do |i|
        @cols.times do |j|
          result << (self[i,j] - other[i,j])
        end
      end
      Matriz.vector(@rows, @cols, result)
  end
  
  #Multiplicacion de matrices
  def *(other)
    if(other.is_a? Numeric)
      result=Array.new
      @rows.times do |i|
        @cols.times do |j|
          result << (self[i,j]*other)
        end
      end
      return Matriz.vector(@rows,@cols,result)
      
    elsif(other.is_a? Matriz)
      raise TypeError, 'Las matrices dadas no se pueden multiplicar entre si' unless (@cols == other.rows)
      result=Array.new
      @rows.times do |i|
        other.cols.times do |j|
          result << 0
          @cols.times do |k|
            result[(result.length)-1]= (result.last + (self[i,k] * other[k,j]))
          end
        end
      end
    end
    Matriz.vector(@rows,other.cols,result)
  end

  #Define el elemento maximo de una matriz
  def max
    aux=self[0,0]
    for i in 0...@rows
      for j in 0...@cols
        r = aux.coerce(self[i,j])
        if (r[0] > r[1])
          aux = r[0]
        else
          aux = r[1]
        end
      end
    end
    aux
  end

  #Define el elemento minimo de una matriz  
  def min
    aux=self[0,0]
    for i in 0...@rows
      for j in 0...@cols
        r = aux.coerce(self[i,j])
        if (r[0] < r[1])
          aux = r[0]
        else
          aux = r[1]
        end
      end
    end
    aux
  end
  
  #Funcion para la conversion implicita de tipo
  def coerce(other)
    [self,other]
  end
  
end
