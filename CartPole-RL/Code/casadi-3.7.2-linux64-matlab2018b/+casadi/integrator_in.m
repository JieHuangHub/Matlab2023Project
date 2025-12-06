function varargout = integrator_in(varargin)
    %INTEGRATOR_IN [INTERNAL] 
    %
    %  {char} = INTEGRATOR_IN()
    %  char = INTEGRATOR_IN(int ind)
    %
    %Get integrator input scheme name by index.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_7d
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/integrator.hpp#L196
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/integrator.cpp#L196-L208
    %
    %
    %
    %.......
    %
    %::
    %
    %  INTEGRATOR_IN()
    %
    %
    %
    %[INTERNAL] 
    %Get input scheme of integrators.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_7b
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/integrator.hpp#L184
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/integrator.cpp#L184-L188
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
    %  INTEGRATOR_IN(int ind)
    %
    %
    %
    %[INTERNAL] 
    %Get integrator input scheme name by index.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_7d
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/integrator.hpp#L196
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/integrator.cpp#L196-L208
    %
    %
    %
    %.............
    %
    %
  [varargout{1:nargout}] = casadiMEX(840, varargin{:});
end
