
class MatrixDSL 
  attr_accessor :op, :act, :modo
  
  def initialize(act,&block)
    self.act=act
    self.op=[]
  end
  
  def to_s
    output = act
    output << "\n#{'=' * act.size}\n\n"

    op.each_with_index do |index|
      output << op[index].to_s 
      output << "\n"
    end

    output << " = " 
    output << (op[0]+op[1]).to_s
    
    output
  end
  
  def option(mod)
    self.modo << mod
  end
  
  def operand(f,c,lista)
    self.op << Matriz.vector(f,c,lista)
  end    
end

ejemplo = MatrixDSL.new("Suma") do 
 
  operand(2,2,[1,1,1,1])
  operand(2,2,[1,1,1,1])
  
end

puts ejemplo