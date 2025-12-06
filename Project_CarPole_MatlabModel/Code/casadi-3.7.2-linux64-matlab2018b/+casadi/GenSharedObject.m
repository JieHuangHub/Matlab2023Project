classdef  GenSharedObject < SwigRef
    %GENSHAREDOBJECT [INTERNAL] C++ includes: generic_shared.hpp
    %
    %
    %
    %
  methods
    function this = swig_this(self)
      this = casadiMEX(3, self);
    end
    function varargout = debug_repr(self,varargin)
    %DEBUG_REPR 
    %
    %  char = DEBUG_REPR(self)
    %
    %
      [varargout{1:nargout}] = casadiMEX(23, self, varargin{:});
    end
    function varargout = is_null(self,varargin)
    %IS_NULL 
    %
    %  bool = IS_NULL(self)
    %
    %
      [varargout{1:nargout}] = casadiMEX(24, self, varargin{:});
    end
    function varargout = hash(self,varargin)
    %HASH [INTERNAL] 
    %
    %  int = HASH(self)
    %
    %Returns a number that is unique for a given Node.
    %
    %If the Object does not point to any node, "0" is returned.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_av
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_shared.hpp#L123
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/generic_shared_impl.hpp#L141-L143
    %
    %
    %
      [varargout{1:nargout}] = casadiMEX(25, self, varargin{:});
    end
    function self = GenSharedObject(varargin)
    %GENSHAREDOBJECT 
    %
    %  new_obj = GENSHAREDOBJECT()
    %
    %
      if nargin==1 && strcmp(class(varargin{1}),'SwigRef')
        if ~isnull(varargin{1})
          self.swigPtr = varargin{1}.swigPtr;
        end
      else
        tmp = casadiMEX(26, varargin{:});
        self.swigPtr = tmp.swigPtr;
        tmp.SwigClear();
      end
    end
    function delete(self)
        if self.swigPtr
          casadiMEX(27, self);
          self.SwigClear();
        end
    end
  end
  methods(Static)
  end
end
