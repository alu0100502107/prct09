# Módulo Bibliográfico
module Bibliografia

  # Clase Referencia para gestionar las de una Bibliografía
  class Referencia
    include Comparable
    # Getters + Setters
    attr_accessor :autores, :titulo, :serie, :editorial, :num_edicion, :fecha_publicacion, :num_isbns

    # Constructor
    def initialize(autores, titulo, serie, editorial, num_edicion, fecha_publicacion, num_isbns)
      @autores = autores
      @titulo = titulo
      @serie = serie
      @editorial = editorial
      @num_edicion = num_edicion
      @fecha_publicacion = fecha_publicacion
      @num_isbns = num_isbns
    end
  
    # Muestra lista de autores
    def print_autor
      count = 0
      lista = ""
      autores.each do |autor|
        count += 1
        lista += autor
        lista += ", " if count != autores.size
      end
      lista
    end

    # Muestra lista de isbn
    def print_isbn
      lista = ""
      num_isbns.each do |isbn|
        count = 0
        lista += "ISBN-" + isbn.delete('^0-9').size.to_s + ": " + isbn
        lista += "\n" if count != num_isbns.size
      end
      lista
    end

    # Para método puts
    def to_s
      "#{print_autor}\n#{titulo}\n#{serie}\n#{editorial}; #{num_edicion} #{fecha_publicacion}\n#{print_isbn}"
    end
    
    # Guerra de las galaxias
    def <=>(other)
      @fecha_publicacion <=> other.fecha_publicacion
    end
  end
  
  class Libro < Referencia
    #Constructor
    def initialize(*parametros)
      super
    end
  end # clase
  
  class Articulo_revista < Referencia
    # Getter + Setter
    attr_accessor :num_issns
    
    # Constructor
    def initialize(*parametros, num_issns)
        super(*parametros)
        @num_issns = num_issns
    end
  end
  
  class Articulo_periodico < Referencia
    # Getter + Setter
    attr_accessor :num_columnas
    
    # Constructor
    def initialize(*parametros, num_columnas)
        super(*parametros)
        @num_columnas = num_columnas
    end
  end
  
  class Documento_electronico < Referencia
    # Getter + Setter
    attr_accessor :url
    
    # Constructor
    def initialize(*parametros, url)
        super(*parametros)
        @url = url
    end
  end
end

