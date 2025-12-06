classdef  FileSerializer < casadi.SerializerBase
    %FILESERIALIZER [INTERNAL] C++ includes: serializer.hpp
    %
    %
    %
    %
  methods
    function self = FileSerializer(varargin)
    %FILESERIALIZER [INTERNAL] 
    %
    %  new_obj = FILESERIALIZER()
    %
    %Advanced serialization of CasADi objects.
    %
    %See: 
    % StringSerializer,  FileDeserializer
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_7q
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/serializer.hpp#L229
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/serializer.cpp#L42-L46
    %
    %
    %
      self@casadi.SerializerBase(SwigRef.Null);
      if nargin==1 && strcmp(class(varargin{1}),'SwigRef')
        if ~isnull(varargin{1})
          self.swigPtr = varargin{1}.swigPtr;
        end
      else
        tmp = casadiMEX(1284, varargin{:});
        self.swigPtr = tmp.swigPtr;
        tmp.SwigClear();
      end
    end
    function delete(self)
        if self.swigPtr
          casadiMEX(1285, self);
          self.SwigClear();
        end
    end
  end
  methods(Static)
  end
end
