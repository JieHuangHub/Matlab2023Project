function varargout = dyn_out(varargin)
    %DYN_OUT [INTERNAL] 
    %
    %  {char} = DYN_OUT()
    %  char = DYN_OUT(int ind)
    %
    %Get output scheme of a DAE function by index.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_25s
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/integrator.hpp#L244
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/integrator.cpp#L244-L246
    %
    %
    %
    %.......
    %
    %::
    %
    %  DYN_OUT()
    %
    %
    %
    %[INTERNAL] 
    %Get output scheme of a DAE function.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_25q
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/integrator.hpp#L236
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/integrator.cpp#L236-L238
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
    %  DYN_OUT(int ind)
    %
    %
    %
    %[INTERNAL] 
    %Get output scheme of a DAE function by index.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_25s
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/integrator.hpp#L244
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/integrator.cpp#L244-L246
    %
    %
    %
    %.............
    %
    %
  [varargout{1:nargout}] = casadiMEX(845, varargin{:});
end
