
# Metodo que calcula el maximo comun divisor

def mcd(x, y)
  x, y = x.abs, y.abs
  while y != 0
    x, y = y, x % y
  end
  x
end
