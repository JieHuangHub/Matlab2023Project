function varargout = dyn_in(varargin)
    %DYN_IN [INTERNAL] 
    %
    %  {char} = DYN_IN()
    %  char = DYN_IN(int ind)
    %
    %Get input scheme of a DAE function by index.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_25r
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/integrator.hpp#L240
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/integrator.cpp#L240-L242
    %
    %
    %
    %.......
    %
    %::
    %
    %  DYN_IN(int ind)
    %
    %
    %
    %[INTERNAL] 
    %Get input scheme of a DAE function by index.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_25r
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/integrator.hpp#L240
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/integrator.cpp#L240-L242
    %
    %
    %
    %.............
    %
    %
    %.......
    %
    %::
    %
    %  DYN_IN()
    %
    %
    %
    %[INTERNAL] 
    %Get input scheme of a DAE function.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_25p
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/integrator.hpp#L232
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/integrator.cpp#L232-L234
    %
    %
    %
    %.............
    %
    %
  [varargout{1:nargout}] = casadiMEX(844, varargin{:});
end
