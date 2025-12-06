function varargout = nlpsol_n_in(varargin)
    %NLPSOL_N_IN [INTERNAL] 
    %
    %  int = NLPSOL_N_IN()
    %
    %Number of NLP solver inputs.
    %
    %Extra doc: https://github.com/casadi/casadi/wiki/L_1t2
    %
    %Doc source: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/nlpsol.hpp#L336
    %
    %Implementation: 
    %https://github.com/casadi/casadi/blob/main/casadi/core/nlpsol.cpp#L336-L338
    %
    %
    %
  [varargout{1:nargout}] = casadiMEX(866, varargin{:});
end
