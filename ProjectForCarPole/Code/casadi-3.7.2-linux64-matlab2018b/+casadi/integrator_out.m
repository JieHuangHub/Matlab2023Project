function varargout = integrator_out(varargin)
    %INTEGRATOR_OUT [INTERNAL] 
    %
    %  {char} = INTEGRATOR_OUT()
    %  char = INTEGRATOR_OUT(int ind)
    %
    %Get output scheme name by index.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_7e
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/integrator.hpp#L210
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/integrator.cpp#L210-L222
    %
    %
    %
    %.......
    %
    %::
    %
    %  INTEGRATOR_OUT(int ind)
    %
    %
    %
    %[INTERNAL] 
    %Get output scheme name by index.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_7e
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/integrator.hpp#L210
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/integrator.cpp#L210-L222
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
    %  INTEGRATOR_OUT()
    %
    %
    %
    %[INTERNAL] 
    %Get integrator output scheme of integrators.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_7c
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/integrator.hpp#L190
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/integrator.cpp#L190-L194
    %
    %
    %
    %.............
    %
    %
  [varargout{1:nargout}] = casadiMEX(841, varargin{:});
end
