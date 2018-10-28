require 'gdb'

def get_register(gdb, reg)
  gdb.reg(reg)
end

def execute(gdb, command)
  puts gdb.execute(command)
end

def cycle_through_reg_32bit(gdb, reg_cycle)
  ret = { eax: nil, ebx: nil, ecx: nil, edx: nil, esi: nil, edi: nil, ebp: nil, esp: nil }

  reg_cycle.each do |rc|
    if rc == 'eax'
      ret[:eax] = gdb.reg(:eax)
    elsif rc == 'ebx'
      ret[:ebx] = gdb.reg(:ebx)
    elsif rc == 'ecx'
      ret[:ecx] = gdb.reg(:ecx)
    elsif rc == 'edx'
      ret[:edx] = gdb.reg(:edx)
    elsif rc == 'esi'
      ret[:esi] = gdb.reg(:esi)
    elsif rc == 'edi'
      ret[:edi] = gdb.reg(:edi)
    elsif rc == 'ebp'
      ret[:ebp] = gdb.reg(:ebp)
    elsif rc == 'esp'
      ret[:esp] = gdb.reg(:esp)
    end
  end

  ret
end

def cycle_through_reg_64bit(gdb, reg_cycle)
  ret = { rax: nil, rbx: nil, rcx: nil, rdx: nil, rsi: nil, rdi: nil, rbp: nil, rsp: nil }

  reg_cycle.each do |rc|
    if rc == 'rax'
      ret[:rax] = gdb.reg(:rax)
    elsif rc == 'rbx'
      ret[:rbx] = gdb.reg(:rbx)
    elsif rc == 'rcx'
      ret[:rcx] = gdb.reg(:rcx)
    elsif rc == 'rdx'
      ret[:rdx] = gdb.reg(:rdx)
    elsif rc == 'rsi'
      ret[:rsi] = gdb.reg(:rsi)
    elsif rc == 'rdi'
      ret[:rdi] = gdb.reg(:rdi)
    elsif rc == 'rbp'
      ret[:rbp] = gdb.reg(:rbp)
    elsif rc == 'rsp'
      ret[:rsp] = gdb.reg(:rsp)
    end
  end

  ret
end
