
class MatrixDSL 
  attr_accessor :operacion, :op, :modo, :show
  
  def initialize(operacion, &block)
    @operacion = operacion
    @op = []
    @modo = "densa"
    @show = ""
    
    instance_eval &block

    case show
      when "console" then puts self
      when "file" 
        then 
          File.open('Matrix.txt', 'w') do |f|
            f.puts self
          end
    end
  end
  
  def to_s
    output = "\n #{@operacion}"
    output << "\n #{'=' * @operacion.size}\n\n"

    op.each_with_index do |opr, index|
      output << " #{index + 1}. #{opr}\n" 
    end
    case operacion
      when "Suma" then output << "  = #{(@op[0]+@op[1]).to_s}\n\n"
      when "Resta" then output << "  = #{(@op[0]-@op[1]).to_s}\n\n"
      when "Producto" then output << "  = #{(@op[0]*@op[1]).to_s}\n\n"        
      else output << " -> Error: Operacion incorrecta\n\n"
    end
    
    output
  end
  
  def option(opt) 
    case opt
      when "densa","dispersa" then @modo = opt
      when "console","file" then @show = opt
    end
  end
  
  def operand(lista)
    aux = []
    lista.each { |i| i.each { |j| aux << j } }
    
    case modo
      when "densa" then op << Matriz_densa.new(lista.size,lista[0].size,aux)
      when "dispersa" then op << Matriz_dispersa.new(lista.size,lista[0].size,aux)
    end    
  end
end

#ejemplo = MatrixDSL.new("Suma") do 
  
#  option "densa"
#  option "console"
  
#  operand [[1,1],[1,1]] 
#  operand [[1,2],[1,1]]
#end