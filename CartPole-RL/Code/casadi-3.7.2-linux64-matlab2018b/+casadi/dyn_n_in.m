function varargout = dyn_n_in(varargin)
    %DYN_N_IN [INTERNAL] 
    %
    %  int = DYN_N_IN()
    %
    %Get the number of inputs for a DAE function.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_25t
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/integrator.hpp#L248
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/integrator.cpp#L248-L250
    %
    %
    %
  [varargout{1:nargout}] = casadiMEX(846, varargin{:});
end
