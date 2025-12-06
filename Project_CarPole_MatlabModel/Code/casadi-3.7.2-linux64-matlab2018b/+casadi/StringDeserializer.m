classdef  StringDeserializer < casadi.DeserializerBase
    %STRINGDESERIALIZER [INTERNAL] C++ includes: serializer.hpp
    %
    %
    %
    %
  methods
    function self = StringDeserializer(varargin)
    %STRINGDESERIALIZER [INTERNAL] 
    %
    %  new_obj = STRINGDESERIALIZER()
    %
    %Advanced deserialization of CasADi objects.
    %
    %See: 
    % StringDeserializer
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_7r
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/serializer.hpp#L241
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/serializer.cpp#L115-L118
    %
    %
    %
      self@casadi.DeserializerBase(SwigRef.Null);
      if nargin==1 && strcmp(class(varargin{1}),'SwigRef')
        if ~isnull(varargin{1})
          self.swigPtr = varargin{1}.swigPtr;
        end
      else
        tmp = casadiMEX(1286, varargin{:});
        self.swigPtr = tmp.swigPtr;
        tmp.SwigClear();
      end
    end
    function delete(self)
        if self.swigPtr
          casadiMEX(1287, self);
          self.SwigClear();
        end
    end
    function varargout = decode(self,varargin)
    %DECODE [INTERNAL] 
    %
    %  DECODE(self, char string)
    %
    %Sets the string to deserialize objects from.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_7s
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/serializer.hpp#L248
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/serializer.cpp#L92-L98
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(1288, self, varargin{:});
    end
  end
  methods(Static)
  end
end
