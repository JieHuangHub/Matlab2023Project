function varargout = dyn_n_out(varargin)
    %DYN_N_OUT [INTERNAL] 
    %
    %  int = DYN_N_OUT()
    %
    %Get the number of outputs for a DAE function.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_25u
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/integrator.hpp#L252
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/integrator.cpp#L252-L254
    %
    %
    %
  [varargout{1:nargout}] = casadiMEX(847, varargin{:});
end
