
class Fraccion 
  
  include Comparable
  attr_accessor :n,:d
  
  def initialize(x,y=1)
    m=mcd(x,y)
    
    # Si el denominador tiene signo negativo, se pasa el signo al numerador
    if(y < 0)
      x, y = -x, -y
    end
    
    @n,@d = x/m,y/m
  end
  
  # Metodo que devuelve el numerador
  def num()
    @n
  end

  # Metodo que devuelve el denominador
  def denom()
    @d
  end
  
  # Conversion a string
  def to_s()
    "#@n/#@d"
  end
  
  # Conversion a flotante
  def to_f()
    (@n.to_f()/@d.to_f())
  end
  
  # Valor absoluto
  def abs()
    
    # Si la fraccion es negativa, se devuelve tras cambiarla de signo
    if(@n < 0)
      return Fraccion.new((-1)*@n, @d)
    end
    
    # Si es positiva, se devuelve
    self
  end
  
  # Calculo del reciproco
  def reciprocal()
    
    # Se intercambia el numerador y el denominador
    # Si el signo es negativo, se pasa al nuevo numerador
    if(@n != @n.abs)
      return Fraccion.new(@d*(-1), (-1)*@n)
    end
    Fraccion.new(@d, @n)
  end
  
  # Sobrecarga del operador "-" unario
  def -@
    Fraccion.new((-1)*@n,@d)
  end
  
  # Suma de fracciones
  def +(other)
    if (other.is_a? Numeric)
      other = Fraccion.new(other)
    end
    # Se aplica el algoritmo de euclides para obtener el mcm (nuevo denominador), a partir del mcd
    den = (@d * other.d) / mcd(@d, other.d)
    num = ((@n * den) / @d) + ((other.n * den) / other.d)
    mx = mcd(num, den)
    Fraccion.new(num / mx, den / mx)
  end
  
  # Resta de fracciones
  def -(other)
    if (other.is_a? Numeric)
      other = Fraccion.new(other)
    end
    # Se aplica el algoritmo de euclides para obtener el mcm (nuevo denominador), a partir del mcd
    den = (@d * other.d) / mcd(@d, other.d)
    num = ((@n * den) / @d) - ((other.n * den) / other.d)
    mx = mcd(num, den)
    Fraccion.new(num / mx, den / mx)
  end
  
  # Producto de fracciones
  def *(other)
    if (other.is_a? Numeric)
      other = Fraccion.new(other)
    end
    num, den = @n * other.n, @d * other.d
    mx = mcd(num, den)
    Fraccion.new(num / mx, den / mx)
  end
  
  # Division de fracciones
  def /(other)
    if (other.is_a? Numeric)
      other = Fraccion.new(other)
    end
    num, den = @n * other.d, @d * other.n
    mx = mcd(num, den)
    Fraccion.new(num / mx, den / mx)
  end
  
  # Modulo de fracciones
  def %(other)
    
    # Se realiza la division, y al cociente se le quita la parte entera, multiplicandola por el divisor para obtener el resto
    div=self.abs/other.abs
    resto=other.abs * (div - Fraccion.new(div.to_f.to_i))
    # Si el dividendo es negativo, el resto sera negativo
    if (@n < 0)
      return -resto
    end
    resto  
  end
  
  # Operador <=>
  def <=>(other)   
    raise TypeError, 'Objeto no valido' unless other.respond_to? :to_f
      self.to_f <=> other.to_f
  end
  
  # Elemento_nulo
  def elemento_nulo
    Fraccion.new(0)
  end
  
  # Coerce
  def coerce(other)
    [self,other]
  end
  
end