class Buffer
  # https://github.com/rapid7/metasploit-framework/blob/master/lib/msf/base/simple/buffer.rb
  # Serializes a buffer to a provided format.  The formats supported are raw,
  # num, dword, ruby, python, perl, bash, c, js_be, js_le, java and psh
  #
  def self.transform(buf, fmt = "ruby", var_name = 'buf')
    default_wrap = 60

    case fmt
      when 'raw'
      when 'num'
        buf = Rex::Text.to_num(buf)
      when 'hex'
        buf = Rex::Text.to_hex(buf, '')
      when 'dword', 'dw'
        buf = Rex::Text.to_dword(buf)
      when 'python', 'py'
        buf = Rex::Text.to_python(buf, default_wrap, var_name)
      when 'ruby', 'rb'
        buf = Rex::Text.to_ruby(buf, default_wrap, var_name)
      when 'perl', 'pl'
        buf = Rex::Text.to_perl(buf, default_wrap, var_name)
      when 'bash', 'sh'
        buf = Rex::Text.to_bash(buf, default_wrap, var_name)
      when 'c'
        buf = Rex::Text.to_c(buf, default_wrap, var_name)
      when 'csharp'
        buf = Rex::Text.to_csharp(buf, default_wrap, var_name)
      when 'js_be'
        buf = Rex::Text.to_unescape(buf, ENDIAN_BIG)
      when 'js_le'
        buf = Rex::Text.to_unescape(buf, ENDIAN_LITTLE)
      when 'java'
        buf = Rex::Text.to_java(buf, var_name)
      when 'powershell', 'ps1'
        buf = Rex::Powershell.to_powershell(buf, var_name)
      when 'vbscript'
        buf = Rex::Text.to_vbscript(buf, var_name)
      when 'vbapplication'
        buf = Rex::Text.to_vbapplication(buf, var_name)
      else
        raise ArgumentError, "Unsupported buffer format: #{fmt}", caller
    end

    return buf
  end

  #
  # Returns the list of supported formats
  #
  def self.transform_formats
    [
      'bash',
      'c',
      'csharp',
      'dw',
      'dword',
      'hex',
      'java',
      'js_be',
      'js_le',
      'num',
      'perl',
      'pl',
      'powershell',
      'ps1',
      'py',
      'python',
      'raw',
      'rb',
      'ruby',
      'sh',
      'vbapplication',
      'vbscript'
    ]
  end
end
